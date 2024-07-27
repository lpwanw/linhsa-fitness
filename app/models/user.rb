# frozen_string_literal: true

class User < ApplicationRecord
  include User::Ransack
  include User::Roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  has_many :courses, foreign_key: :creator_id, dependent: :nullify, inverse_of: :creator
end
