# frozen_string_literal: true

require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(255) }

    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to allow_value("0934567890").for(:phone) }
    it { is_expected.not_to allow_value("123456").for(:phone) }

    it { is_expected.to validate_presence_of(:note) }
    it { is_expected.to validate_length_of(:note).is_at_least(3).is_at_most(255) }

    it { is_expected.to validate_presence_of(:free_time) }
    it { is_expected.to validate_length_of(:free_time).is_at_least(3).is_at_most(255) }

    it { is_expected.to validate_presence_of(:status) }
  end

  describe "enums" do
    it "defines the correct enum values" do
      expect(subject).to define_enum_for(:status)
        .with_values(
          registered: "registered",
          called: "called",
          failed: "failed",
          appointment_scheduled: "appointment_scheduled"
        ).backed_by_column_of_type(:string)
    end
  end
end
