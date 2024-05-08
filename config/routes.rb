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

    scope(:admin) do
      devise_for(:admins, controllers: { sessions: 'v1/sessions', registrations: 'v1/registrations' }, skip: [:registrations, :sessions])

      devise_scope(:admin) do
        post   :sign_in,  to: 'sessions#create',  as: :admin_sign_in
        delete :sign_out, to: 'sessions#destroy', as: :admin_sign_out
      end
    end

    namespace :admin do
      resources :admins, only: [:destroy]
    end
  end
end
