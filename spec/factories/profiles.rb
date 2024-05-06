# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user
    name { FFaker::Name.name }
    dob { 20.years.ago }
  end
end
