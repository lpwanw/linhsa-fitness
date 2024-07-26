# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ImportGuestsController, type: :controller do
  describe "POST #create" do
    subject { post :create, params:, format: :turbo_stream }

    let(:current_user) { create(:user, :admin) }
    let(:params) do
      {
        import_file: {
          name:,
          file:,
        },
      }
    end
    let(:name) { FFaker::Company.name }
    let(:file) { fixture_file_upload "import_guest.csv", "application/csv" }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when valid params" do
      context "when it change ImportFile count" do
        it { expect { subject }.to change(ImportFile, :count).by(1) }
      end

      context "when it redirect" do
        let(:last_record) { ImportFile.last }

        before { subject }

        it { expect(flash[:notice]).to eq(I18n.t("admin.import_guests.create.success")) }
        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(admin_import_guest_path(last_record)) }
        it { expect(last_record.name).to eq name }
      end
    end

    context "when invalid params" do
      let(:file) { nil }

      context "when it not change ImportFile count" do
        it { expect { subject }.not_to change(ImportFile, :count) }
      end

      context "when render create" do
        before { subject }

        it { expect(flash[:alert]).to eq(I18n.t("admin.import_guests.create.failed")) }
        it { expect(response).to have_http_status(:ok) }
        it { expect(response).to render_template(:create, format: :turbo_stream) }
      end
    end
  end
end
