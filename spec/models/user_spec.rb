# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_many(:boards).dependent(:delete_all) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
