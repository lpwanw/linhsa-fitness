# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "POST #create" do
    subject { post :create, params: }

    let(:current_user) { create(:user, :admin) }
    let(:params) do
      {
        course: {
          name:,
        },
      }
    end
    let(:name) { FFaker::Company.name }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    xcontext "when valid params" do
      context "when it change ImportFile count" do
        it { expect { subject }.to change(Course, :count).by(1) }
      end

      context "when it redirect" do
        let(:last_record) { Course.last }

        before { subject }

        it { expect(flash[:notice]).to eq(I18n.t("admin.import_guests.create.success")) }
        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(admin_import_guest_path(last_record)) }
        it { expect(last_record.name).to eq name }
      end
    end

    context "when invalid params" do
      let(:name) { "" }

      context "when it not change ImportFile count" do
        it { expect { subject }.not_to change(Course, :count) }
      end

      context "when render create" do
        before { subject }

        it { expect(response).to have_http_status(:unprocessable_entity) }
        it { expect(response).to render_template(:new) }
      end
    end
  end
end
