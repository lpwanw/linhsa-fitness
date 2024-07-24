# frozen_string_literal: true

FactoryBot.define do
  factory :import_file do
    name { FFaker::NameVN.last_first }
    model { [Guest.name].sample }
  end
end
