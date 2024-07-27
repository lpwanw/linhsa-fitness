# frozen_string_literal: true

class ImportFile < ApplicationRecord
  include ImportFile::BeforeValidation
  include ImportFile::AfterCreate
  include ImportFile::Ransack

  has_one_attached :file

  enum status: {
    created: "created",
    processing: "processing",
    completed: "completed",
    error: "error",
  }

  validates :model, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 255 }
  validates :status, inclusion: { in: statuses.values }, presence: true
  validates :file, presence: true

  scope :guest, -> { where(model: Guest.name) }
end
