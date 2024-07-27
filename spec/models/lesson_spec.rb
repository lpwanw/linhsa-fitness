# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lesson, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:course) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255).is_at_least(3) }
  end
end
