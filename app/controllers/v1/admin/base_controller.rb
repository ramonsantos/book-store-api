# frozen_string_literal: true

class V1::Admin::BaseController < ApplicationController
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :render_user_not_authorized_error

  def render_user_not_authorized_error(_error)
    render(json: build_errors(:not_authorized, nil), status: :forbidden)
  end

  def pundit_user
    current_admin
  end
end
