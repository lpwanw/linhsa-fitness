# frozen_string_literal: true

require "rails_helper"

RSpec.describe Course, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:creator).class_name("User").optional(true).inverse_of(:courses) }
    it { is_expected.to have_many(:lessons).dependent(:delete_all) }
  end

  describe "enums" do
    it "defines the correct enum values" do
      expect(subject).to define_enum_for(:status)
        .with_values(
          draft: "draft",
          completed: "completed"
        ).backed_by_column_of_type(:string)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255).is_at_least(3) }
  end
end
