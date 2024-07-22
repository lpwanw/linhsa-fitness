# frozen_string_literal: true

class CreateImportFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :import_files, id: :uuid do |t|
      t.string :name, index: true, null: false
      t.string :model, null: false
      t.string :status, null: false, default: "created"

      t.timestamps
    end
  end
end
