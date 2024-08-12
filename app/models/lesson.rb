# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 255 }

  has_one_attached :video

  validates :video, content_type: %w[video/mp4 video/mpeg video/webm video/ogg video/x-msvideo]
end
