# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :creator, class_name: "User", optional: true, inverse_of: :courses

  enum status: {
    draft: "draft",
    completed: "completed",
  }

  has_many :lessons, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 255 }, allow_blank: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :lessons

  delegate :email, to: :creator, allow_nil: true, prefix: true
end
