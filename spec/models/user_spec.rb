# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:roles) }
    it { is_expected.to have_many(:courses).with_foreign_key(:creator_id).dependent(:nullify).inverse_of(:creator) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "#assign_default_role" do
    context "when after_create" do
      let(:user) { build(:user) }

      subject { user.save }

      before do
        allow(user).to receive(:assign_default_role).and_call_original
        subject
      end

      it { expect(user).to have_received(:assign_default_role) }
    end

    context "when change Role count" do
      subject { create(:user) }

      it { expect { subject }.to change(Role, :count).by(1) }
    end
  end

  UserRoles.roles.each do |role|
    describe "##{role}?" do
      subject { user.public_send("#{role}?") }

      let(:user) { create(:user) }

      before { allow(user).to receive(:has_role?).with(role).and_return(true) }

      it do
        subject
        expect(user).to have_received(:has_role?).with(role)
      end
    end
  end

  describe "#assigned_user_roles" do
    subject { user.assigned_user_roles }

    let(:user) { create(:user) }

    it { is_expected.to eq [:member] }
  end

  describe "ransack" do
    describe ".ransackable_attributes" do
      subject { described_class.ransackable_attributes }

      it { is_expected.to eq %w[id email] }
    end

    describe ".ransackable_associations" do
      subject { described_class.ransackable_associations }

      it { is_expected.to eq %w[roles] }
    end
  end
end
