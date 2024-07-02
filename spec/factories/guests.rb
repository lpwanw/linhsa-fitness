# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    phone { FFaker::PhoneNumberAU.mobile_phone_number.gsub(" ", "") }
    name { FFaker::NameVN.last_first }
    time_to_call { FFaker::Time.date.beginning_of_day.strftime("%H:%M") }
    note { nil }
  end
end
