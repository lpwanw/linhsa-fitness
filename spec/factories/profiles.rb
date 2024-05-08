# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user
    name { FFaker::Name.name }
    dob { 20.years.ago }
    avatar do
      Rack::Test::UploadedFile.new Rails.root.join("spec/factories/default_avatar.png"),
                                   "image/png"
    end
  end
end
