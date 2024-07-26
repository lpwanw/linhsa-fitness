# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ImportGuestsController, type: :controller do
  describe "GET #show" do
    subject { get :show, params: { id: } }

    let(:current_user) { create(:user, :admin) }
    let(:import_file) { create(:import_file, model: "Guest") }
    let(:id) { import_file.id }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when valid id" do
      before { subject }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:show) }
    end

    context "when invalid id" do
      let(:id) { "invalid" }

      before { subject }

      it { expect(flash[:alert]).to eq(I18n.t("errors.messages.not_found")) }
      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(admin_import_guests_path) }
    end
  end
end
