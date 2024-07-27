# frozen_string_literal: true

require "rails_helper"

RSpec.describe MarketingController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    context "when user not signed_in" do
      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:index, layout: "layouts/marketing") }
    end

    context "when user is signed_in" do
      let(:user) { create(:user) }
      let(:role) { :member }

      before do
        user.add_role role
        sign_in user
        subject
      end

      context "when user is admin" do
        let(:role) { :admin }

        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(admin_root_path) }
      end

      context "when user is teacher" do
        let(:role) { :teacher }

        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(teacher_root_path) }
      end

      context "when user is member" do
        let(:role) { :member }

        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(app_path) }
      end
    end
  end
end
