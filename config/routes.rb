# frozen_string_literal: true

Rails.application.routes.draw do
  get '/health', to: 'health#index'

  api_version(module: 'V1', header: { name: 'X-Version', value: 'v1' }) do
    devise_for(:users, controllers: { sessions: 'v1/sessions', registrations: 'v1/registrations' }, skip: [:registrations, :sessions])

    devise_scope(:user) do
      post   :sign_up,  to: 'registrations#create'
      post   :sign_in,  to: 'sessions#create'
      delete :sign_out, to: 'sessions#destroy'
    end
  end
end
