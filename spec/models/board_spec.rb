# frozen_string_literal: true

require "rails_helper"

RSpec.describe Board, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:lists).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(20).is_at_most(255) }
  end
end
