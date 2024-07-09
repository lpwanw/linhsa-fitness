# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:roles) }
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
end
