# frozen_string_literal: true

class Guest < ApplicationRecord
  include Guest::Ransack

  enum status: {
    registered: "registered",
    called: "called",
    failed: "failed",
    appointment_scheduled: "appointment_scheduled",
  }

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 255 }
  validates :phone, presence: true
  validates :phone, format: { with: /\A0[35789]\d{8}\z/ }
  validates :note, presence: true
  validates :note, length: { minimum: 3, maximum: 255 }
  validates :free_time, presence: true
  validates :free_time, length: { minimum: 3, maximum: 255 }
  validates :status, inclusion: { in: statuses.values }, presence: true
end
