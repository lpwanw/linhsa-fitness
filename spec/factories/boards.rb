# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    user
    title { FFaker::Lorem.sentence }
  end
end
