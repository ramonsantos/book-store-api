# frozen_string_literal: true

class V1::RegistrationsController < Devise::RegistrationsController
  before_action :required_params, only: [:create]

  respond_to :json

  # POST /sign_up
  def create
    build_resource(user_params).save!

    render(json: created_user_response, status: :created)
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def required_params
    [:email, :password].each { |required_param| user_params.require(required_param) }
  end

  def created_user_response
    {
      data: nil,
      meta: {
        info: 'User created with success.'
      }
    }
  end
end
