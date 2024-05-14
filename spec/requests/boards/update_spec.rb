# frozen_string_literal: true

require "rails_helper"

RSpec.describe BoardsController, type: :controller do
  subject { patch :update, params: { id: board.id, board: board_attributes } }

  let!(:user) { create(:user) }
  let!(:board) { create(:board, user:) }
  let(:board_attributes) { attributes_for(:board) }

  describe "PATCH update" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user signed in" do
      before do
        sign_in user
      end

      context "when board is valid" do
        it "creates a new board" do
          expect { subject }.not_to change(Board, :count)
        end

        it "updates board attribute" do
          subject
          expect(board.reload.title).to eq board_attributes[:title]
        end

        it "redirects to boards index page" do
          subject
          expect(response).to redirect_to board_url(board)
          expect(response).to have_http_status :redirect
        end
      end

      context "when board is invalid" do
        let(:board_attributes) { { title: "" } }

        it "does not update board attribute" do
          expect { subject }.not_to change(board, :title)
        end

        it "renders edit template" do
          subject
          expect(response).to render_template :edit
        end
      end
    end
  end
end
