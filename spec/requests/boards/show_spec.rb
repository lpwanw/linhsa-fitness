# frozen_string_literal: true

require "rails_helper"

RSpec.describe BoardsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:board) { create(:board, user:) }

  describe "GET show" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        get :show, params: { id: board.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user signed in" do
      before { sign_in user }

      context "when board is belong to user" do
        let!(:board) { create(:board, user:) }

        before { get :show, params: { id: board.id } }

        it { expect(response).to render_template :show }
        it { expect(response).to have_http_status :ok }
        it { expect(assigns(:board)).to eq board }
      end

      context "when board is not belong to user" do
        let!(:other_user) { create(:user) }
        let!(:other_board) { create(:board, user: other_user) }

        before { get :show, params: { id: other_board.id } }

        it { expect(response).to redirect_to boards_url }
        it { expect(assigns(:board)).to be_nil }
        it { expect(response).to have_http_status :redirect }
      end
    end
  end
end
