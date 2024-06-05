# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    board
    title { FFaker::Lorem.sentence }
  end
end
