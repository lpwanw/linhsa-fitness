# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.references :board, null: false, foreign_key: true
      t.string :title, null: false, limit: 255

      t.timestamps
    end
  end
end
