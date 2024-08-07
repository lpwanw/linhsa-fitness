# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 255 }

  has_one_attached :video
end
