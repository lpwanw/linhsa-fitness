# frozen_string_literal: true

require "rails_helper"

RSpec.describe BoardsController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET new" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user signed in" do
      before do
        sign_in user
        get :new
      end

      it { expect(response).to render_template :new }
      it { expect(response).to have_http_status :ok }
      it { expect(assigns(:board).new_record?).to be true }
    end
  end
end
