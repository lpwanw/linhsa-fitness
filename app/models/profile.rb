# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, length: { maximum: 100 }

  validates :dob, presence: true
  validates :dob, comparison: { less_than: Time.current.to_date }

  delegate :email, to: :user, prefix: true
end
