# frozen_string_literal: true

class AddStatusToCourse < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :status, :string, default: "draft"
  end
end
