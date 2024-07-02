# frozen_string_literal: true

class Guest < ApplicationRecord
  # TODO: add phone format
  validates :phone, presence: true
  validates :phone, uniqueness: true
  validates :phone, length: { maximum: 10 }

  validates :name, presence: true
  validates :name, length: { maximum: 50, minimum: 3 }

  # TODO: Add time_to_call enum
  validates :time_to_call, length: { maximum: 100 }
end
