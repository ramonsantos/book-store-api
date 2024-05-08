# frozen_string_literal: true

class FailureApp < Devise::FailureApp
  def respond
    json_api_error_response
  end

  def json_api_error_response
    self.status        = :unauthorized
    self.content_type  = 'application/json'
    self.response_body = build_response_body
  end

  private

  def build_response_body
    {
      errors: build_unauthorized_body,
      meta: {}
    }.to_json
  end

  def build_unauthorized_body
    [
      {
        title: 'Unauthorized',
        detail: 'Invalid Email or password.',
        code: :unauthorized
      }
    ]
  end
end
