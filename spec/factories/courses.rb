# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { FFaker::SportUS.name }
    description { "" }
    creator { association :user }
  end
end
