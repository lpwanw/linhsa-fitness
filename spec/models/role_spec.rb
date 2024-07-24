# frozen_string_literal: true

require "rails_helper"

RSpec.describe Role, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:users) }
  end

  describe "ransack" do
    describe ".ransackable_attributes" do
      subject { described_class.ransackable_attributes }

      it { is_expected.to eq %w[name] }
    end
  end
end
