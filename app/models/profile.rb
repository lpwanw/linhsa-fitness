# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :name, length: { maximum: 100 }

  validates :dob, comparison: { less_than: Time.current.to_date }

  validates :locale, presence: true
  validates :locale, length: { is: 2 }
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }

  delegate :email, to: :user, prefix: true

  has_one_attached :avatar
end
