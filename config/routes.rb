# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get "up" => "rails/health#show", as: :rails_health_check

  root "marketing#index"

  devise_for :users

  resources :guests, only: %i[new create]

  namespace :member do
    get "/", to: "dashboard#index", as: :root
  end

  namespace :admin do
    get "/", to: "dashboard#index", as: :root

    resources :users, only: %i[index]
    resources :guests, only: %i[index]
  end

  namespace :teacher do
    get "/", to: "dashboard#index", as: :root
  end
end
