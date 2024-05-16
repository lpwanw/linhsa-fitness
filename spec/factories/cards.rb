# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    list
  end
end
