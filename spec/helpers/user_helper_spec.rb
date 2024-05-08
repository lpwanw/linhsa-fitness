# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserHelper, type: :helper do
  describe "#avatar_for" do
    let(:user) { create(:user, :with_profile) }

    context "when user has profile avatar" do
      before do
        user.profile_avatar.attach(io: File.open("spec/factories/default_avatar.png"), filename: "default_avatar.png")
      end

      it "returns profile avatar" do
        expect(helper.avatar_for(user)).to eq(user.profile_avatar)
      end
    end

    context "when user does not have profile avatar" do
      before { user.profile_avatar.purge }

      it "returns default avatar" do
        expect(helper.avatar_for(user)).to eq("default_avatar.png")
      end
    end
  end
end
