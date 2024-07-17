# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    name { FFaker::NameVN.last_first }
    phone { "0#{[3, 5, 7, 8, 9].sample}#{FFaker::PhoneNumberFR.phone_number.split.join.last(8)}" }
    note { FFaker::Lorem.sentences }
    free_time { FFaker::Lorem.sentence }
    status { Guest.statuses.values.sample }
  end
end
