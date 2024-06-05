# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :name
      t.date :dob
      t.string :locale, null: false, default: "en", limit: 2

      t.timestamps
    end
  end
end
