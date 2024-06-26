# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.email }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { Time.zone.now }

    trait :with_profile do
      after(:create) do |user|
        create(:profile, user:)
      end
    end
  end
end
