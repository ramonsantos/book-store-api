# frozen_string_literal: true

class ApiErrorSerializer
  attr_reader :error, :options

  def initialize(error, options = {})
    @error   = error
    @options = options
  end

  def serialize(method)
    {
      errors: send(method),
      meta: {}
    }
  end

  private

  def parameter_missing
    [
      {
        title: 'Attribute is required',
        detail: "The attribute '#{error.param}' can't be blank",
        code: :attribute_blank
      }
    ]
  end

  def not_authorized
    [
      {
        title: 'Not authorized',
        detail: 'User not authorized.',
        code: :forbidden
      }
    ]
  end

  def record_not_found
    [
      {
        title: 'Resource not found',
        detail: "The #{error.model} '#{options[:identifier]}' is not found",
        code: :resource_not_found
      }
    ]
  end

  def record_invalid
    record.errors.errors.map! do |error|
      if error.message == 'must exist'
        type = :not_exist

        {
          title:  I18n.t("api_error.record_invalid.#{type}.title"),
          detail: build_detail(error.attribute.to_s.camelize, error, type),
          code:   I18n.t("api_error.record_invalid.#{type}.code")
        }
      else
        {
          title:  I18n.t("api_error.record_invalid.#{error.type}.title"),
          detail: build_detail(record.class, error),
          code:   I18n.t("api_error.record_invalid.#{error.type}.code")
        }
      end
    end
  end

  def record
    @record ||= error.record
  end

  def build_detail(record, error, type = nil)
    I18n.t(
      "api_error.record_invalid.#{type || error.type}.detail",
      entity: record,
      attribute: error.attribute,
      count: error.try(:options).try(:fetch, :count, nil)
    )
  end
end
