# frozen_string_literal: true

require "rails_helper"

RSpec.describe ImportFile, type: :model do
  describe "validations" do
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(255) }
    it { is_expected.to validate_presence_of(:model) }

    it { is_expected.to validate_presence_of(:status) }
  end

  describe "enums" do
    it "defines the correct enum values" do
      expect(subject).to define_enum_for(:status)
        .with_values(
          created: "created",
          processing: "processing",
          completed: "completed",
          error: "error",
        ).backed_by_column_of_type(:string)
    end
  end

  describe "callbacks" do
    describe "after_create" do
      let(:import_file) { build(:import_file) }

      subject { import_file.save! }

      describe "#import_file" do
        it do
          expect { subject }.to(
            have_enqueued_job(Guest::ImportJob)
              .with(import_file)
              .exactly(:once)
          )
        end
      end
    end
  end

  describe "ransack" do
    describe ".ransackable_attributes" do
      subject { described_class.ransackable_attributes }

      it { is_expected.to eq %w[name status] }
    end

    describe ".ransackable_associations" do
      subject { described_class.ransackable_associations }

      it { is_expected.to be_empty }
    end
  end
end
