# frozen_string_literal: true

require "rails_helper"

RSpec.describe BoardsController, type: :controller do
  let!(:user) { create(:user) }

  describe "POST create" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user signed in" do
      before do
        sign_in user
      end

      context "when board is valid" do
        let(:board_attributes) { attributes_for(:board) }

        it "creates a new board" do
          expect { post :create, params: { board: board_attributes } }.to change(Board, :count).by(1)
        end

        it "redirects to boards index page" do
          post :create, params: { board: board_attributes }
          expect(response).to redirect_to board_url(Board.last)
        end
      end
    end
  end
end
