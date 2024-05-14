# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resource :profile, controller: :profile, only: [:show, :update]
  resources :boards
end
