# frozen_string_literal: true

class Guest < ApplicationRecord
  validates :phone, presence: true
  validates :phone, uniqueness: { case_sensitive: false }
  validates :phone, length: { maximum: 10 }

  validates :name, presence: true
  validates :name, length: { maximum: 50, minimum: 3 }

  validates :time_to_call, length: { maximum: 100 }
end
