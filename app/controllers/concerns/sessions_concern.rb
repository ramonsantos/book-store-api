# frozen_string_literal: true

module SessionsConcern
  extend ActiveSupport::Concern

  included do
    respond_to :json
  end

  private

  def respond_with(_resource, _opts = {})
    render(json: jwt_response, status: :created)
  end

  def respond_to_on_destroy
    head(:no_content)
  end

  def jwt_token
    request.env['warden-jwt_auth.token']
  end

  def jwt_response
    {
      data: { token: jwt_token },
      meta: {}
    }
  end
end
