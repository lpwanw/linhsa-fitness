# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "POST #update" do
    subject { patch :update, params:, format: :turbo_stream }

    let(:current_user) { create(:user, :admin) }
    let(:params) do
      {
        course: {
          name:,
        },
        id:,
      }
    end
    let(:name) { FFaker::Company.name }
    let(:course) { create(:course, creator: current_user) }
    let(:id) { course.id }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when valid params" do
      context "when it redirect" do
        before { subject }

        it { expect(flash[:notice]).to eq(I18n.t("admin.courses.update.Success")) }
        it { expect(response).to have_http_status(:successful) }
        it { expect(response).to render_template(:update) }
        it { expect(course.reload.name).to eq name }
      end
    end

    context "when invalid params" do
      let(:name) { "" }

      context "when render create" do
        before { subject }

        it { expect(flash[:alert]).to eq(I18n.t("admin.courses.update.Failed")) }
        it { expect(response).to have_http_status(:successful) }
        it { expect(response).to render_template(:update) }
      end
    end

    context "when invalid id" do
      let(:id) { "invalid_id" }

      context "when render create" do
        before { subject }

        it { expect(response).to have_http_status(:redirect) }
        it { expect(flash[:alert]).to eq "không tìm thấy" }
        it { expect(response).to redirect_to(root_path) }
      end
    end
  end
end