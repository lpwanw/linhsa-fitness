# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests, id: :uuid do |t|
      t.string :name, null: false, index: true
      t.string :phone, null: false, index: true
      t.string :note, null: false
      t.string :free_time, null: false
      t.string :status, null: false, default: "registered"
      t.string :sale_note

      t.timestamps
    end
  end
end
