# frozen_string_literal: true

require "rails_helper"

RSpec.describe BoardsController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET index" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user signed in" do
      let!(:board) { create(:board, user:) }

      before do
        sign_in user
        get :index
      end

      it { expect(response).to render_template :index }
      it { expect(response).to have_http_status :ok }
      it { expect(assigns(:boards)).to eq user.boards.all }
    end
  end
end
