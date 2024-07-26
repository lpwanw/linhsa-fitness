# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ConsoleController, type: :controller do
  describe "GET #show" do
    subject { get :show }

    let(:current_user) { create(:user, :admin) }
    let(:username) { "user" }
    let(:password) { "password" }

    it_behaves_like "authenticate_admin_role!"

    before do
      stub_const("ENV", { "CONSOLE_USER" => "user" })
      stub_const("ENV", { "CONSOLE_PASSWORD" => "password" })
      request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(
        username,
        password
      )
      sign_in current_user
      subject
    end

    context "when authenticated" do
      let(:username) { "user" }
      let(:password) { "password" }

      it { expect(subject).to have_http_status(:ok) }
    end

    context "when not_authenticated" do
      let(:username) { "admin" }
      let(:password) { "wrong_password" }

      it { expect(subject).to have_http_status(:unauthorized) }
    end
  end
end
