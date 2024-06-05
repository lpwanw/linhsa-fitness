# frozen_string_literal: true

require "rails_helper"

RSpec.describe List, type: :model do
  describe "associations" do
    it { should belong_to(:board) }
    it { should have_many(:cards).dependent(:delete_all) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(20).is_at_most(255) }
  end
end
