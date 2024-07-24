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

  describe "callbacks" do
    describe "after_create" do
      subject { guest.save }

      let(:guest) { build(:guest, skip_notify_admin: false) }

      it { expect { subject }.to have_enqueued_mail(GuestMailer, :notify_admin) }
    end
  end

  describe "ransack" do
    describe ".ransackable_attributes" do
      subject { described_class.ransackable_attributes }

      it { is_expected.to eq %w[name status phone] }
    end

    describe ".ransackable_associations" do
      subject { described_class.ransackable_associations }

      it { is_expected.to be_empty }
    end
  end
end
