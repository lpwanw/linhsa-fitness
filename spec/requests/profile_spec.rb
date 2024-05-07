# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfileController, type: :controller do
  describe "GET /show" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user signed in" do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :show
      end

      it { expect(response).to render_template(:show) }
      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe "PATCH /update" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        patch :update, params: { profile: { name: "John Doe", dob: "1990-01-01" } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user signed in" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      context "when profile is valid" do
        it "redirects to profile page" do
          patch :update, params: { profile: { name: "John Doe", dob: "1990-01-01" } }
          expect(response).to redirect_to(profile_path)
        end

        it "updates profile" do
          patch :update, params: { profile: { name: "John Doe", dob: "1990-01-01" } }
          user.reload
          expect(user.profile.name).to eq("John Doe")
          expect(user.profile.dob).to eq(Date.new(1990, 1, 1))
        end
      end

      context "when profile is invalid" do
        it "renders show page" do
          patch :update, params: { profile: { name: "", dob: "" } }
          expect(response).to render_template(:show)
        end
      end
    end
  end
end
