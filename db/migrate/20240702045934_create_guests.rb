# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :phone, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :time_to_call
      t.text :note

      t.timestamps
    end
  end
end
