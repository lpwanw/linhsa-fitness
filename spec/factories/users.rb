# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.email }
    password { "Aa@123456" }
    password_confirmation { "Aa@123456" }
    confirmed_at { Time.current }

    trait :admin do
      after(:create) do |user|
        user.add_role :admin
      end
    end

    trait :teacher do
      after(:create) do |user|
        user.add_role :teacher
      end
    end

    trait :no_role do
      after(:create) do |user|
        user.remove_role :member
      end
    end
  end
end
