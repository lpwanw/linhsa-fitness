# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get "up" => "rails/health#show", as: :rails_health_check

  root "marketing#index"

  devise_for :users

  resources :guests, only: %i[new create]

  namespace :member do
    resources :dashboard, controller: :dashboard, only: %i[index]
  end
end
