# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.1]
  def up
    create_table :guests do |t|
      t.string :phone, null: false
      t.string :name, null: false
      t.string :time_to_call
      t.text :note

      t.timestamps
    end

    execute <<-SQL.squish
      CREATE UNIQUE INDEX unique_lower_phone ON guests (lower(phone));
    SQL
  end

  def down
    execute <<-SQL.squish
      DROP INDEX IF EXISTS unique_lower_phone;
    SQL

    drop_table :guests
  end
end
