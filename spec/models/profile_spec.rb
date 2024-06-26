# frozen_string_literal: true

require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject { build(:profile) }

    it { is_expected.to validate_length_of(:name).is_at_most(50) }

    it { expect(subject.avatar).to be_an_instance_of(ActiveStorage::Attached::One) }

    it { is_expected.to validate_presence_of(:locale) }
    it { is_expected.to validate_length_of(:locale).is_equal_to(2) }
    it { is_expected.to validate_inclusion_of(:locale).in_array(%w[en vi]) }
  end
end
