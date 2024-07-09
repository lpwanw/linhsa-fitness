# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.email }
    password { "Aa@123456" }
    password_confirmation { "Aa@123456" }
    confirmed_at { Time.current }
  end
end
