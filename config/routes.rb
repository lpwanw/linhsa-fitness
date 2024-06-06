# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resource :profile, controller: :profile, only: [:show, :update]
end
