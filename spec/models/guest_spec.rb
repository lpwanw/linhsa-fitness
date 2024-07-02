# frozen_string_literal: true

require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "validations" do
    subject { build(:guest) }

    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }
    it { is_expected.to validate_length_of(:phone).is_at_most(10) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50).is_at_least(3) }

    it { is_expected.to validate_length_of(:time_to_call).is_at_most(100) }
  end
end
