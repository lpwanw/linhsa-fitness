# frozen_string_literal: true

class ImportFile < ApplicationRecord
  include ImportFile::BeforeValidation

  has_one_attached :file

  enum status: {
    created: "created",
    processing: "processing",
    processed: "processed",
  }

  validates :model, presence: true
  validates :name, presence: true
  validates :status, inclusion: { in: statuses.values }, presence: true


  scope :guest, -> { where(model: Guest.name) }
end
