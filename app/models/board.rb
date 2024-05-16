# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { minimum: 20, maximum: 255 }
end
