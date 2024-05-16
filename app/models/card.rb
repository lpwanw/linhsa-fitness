# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :list

  validates :title, presence: true
  validates :title, length: { minimum: 20, maximum: 255 }
end
