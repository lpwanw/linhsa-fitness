# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { minimum: 20, maximum: 255 }
end
