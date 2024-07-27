# frozen_string_literal: true

require "rails_helper"

RSpec.describe Course, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:creator).class_name("User").optional(true).inverse_of(:courses) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255).is_at_least(3) }
  end
end
