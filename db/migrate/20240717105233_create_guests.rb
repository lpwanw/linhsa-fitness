# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :note, null: false
      t.string :free_time, null: false
      t.string :status, null: false, default: "registered"
      t.string :sale_note

      t.timestamps
    end
  end
end
