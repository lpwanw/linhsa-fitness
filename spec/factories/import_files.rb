# frozen_string_literal: true

FactoryBot.define do
  factory :import_file do
    name { FFaker::NameVN.last_first }
    model { [Guest.name].sample }
    file do
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/import_guest.csv"),
        "application/csv"
      )
    end
  end
end
