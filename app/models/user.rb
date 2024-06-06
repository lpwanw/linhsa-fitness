# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  delegate :name, :dob, :avatar, to: :profile, prefix: true, allow_nil: true
  delegate :locale, to: :profile, prefix: false, allow_nil: true
end
