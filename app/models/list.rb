# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board
  has_many :cards, dependent: :delete_all

  validates :title, presence: true
  validates :title, length: { minimum: 20, maximum: 255 }
end
