# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    name { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    course
  end
end
