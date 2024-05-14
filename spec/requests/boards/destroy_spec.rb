# frozen_string_literal: true

require "rails_helper"

RSpec.describe BoardsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:board) { create(:board, user:) }

  describe "DELETE destroy" do
    context "when user not signed in" do
      it "redirects to sign in page" do
        delete :destroy, params: { id: board.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user signed in" do
      before { sign_in user }

      context "when board is belong to user" do
        let!(:board) { create(:board, user:) }

        context "when board is successfully destroyed" do
          before { delete :destroy, params: { id: board.id } }

          it { expect(response).to redirect_to boards_url }
          it { expect(response).to have_http_status :redirect }
          it { expect(Board.exists?(board.id)).to be false }
        end

        context "when Board count is increate" do
          it "deletes the board and associated lists" do
            expect { delete :destroy, params: { id: board.id } }.to change(Board, :count).by(-1)
          end
        end
      end

      context "when board is not belong to user" do
        let!(:other_user) { create(:user) }
        let!(:other_board) { create(:board, user: other_user) }

        before { delete :destroy, params: { id: other_board.id } }

        it { expect(response).to redirect_to boards_url }
        it { expect(response).to have_http_status :redirect }
      end
    end
  end
end
