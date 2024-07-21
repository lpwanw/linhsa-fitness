# frozen_string_literal: true

class CreateIndexOnNameAndPhoneOfGuest < ActiveRecord::Migration[7.1]
  def change
    add_index :guests, :name
    add_index :guests, :phone
  end
end
