# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "marketing#index"

  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resource :profile, controller: :profile, only: [:show, :update]
end
