# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false, index: { unique: true }
      t.json :description
      t.references :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
