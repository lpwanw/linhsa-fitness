# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :creator, class_name: "User", optional: true, inverse_of: :courses

  has_many :lessons, dependent: :delete_all

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 255 }
end
