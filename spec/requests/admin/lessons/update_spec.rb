# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::LessonsController, type: :controller do
  describe "PATCH #create" do
    subject { post :update, params:, format: :turbo_stream }

    let(:current_user) { create(:user, :admin) }
    let(:course) { create(:course, creator: current_user) }
    let(:lesson) { create(:lesson, course:) }
    let(:course_id) { course.id }
    let(:id) { lesson.id }
    let(:params) do
      {
        lesson: {
          name:,
        },
        course_id:,
        id:,
      }
    end
    let(:name) { FFaker::Company.name }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when valid params" do
      context "when it redirect" do
        before { subject }

        it { expect(flash[:notice]).to eq(I18n.t("admin.lessons.update.Success")) }
        it { expect(response).to have_http_status(:successful) }
        it { expect(response).to render_template(:update) }
        it { expect(lesson.reload.name).to eq name }
      end
    end

    context "when invalid params" do
      let(:name) { "" }

      context "when render create" do
        before { subject }

        it { expect(flash[:alert]).to eq(I18n.t("admin.lessons.update.Failed")) }
        it { expect(response).to have_http_status(:successful) }
        it { expect(response).to render_template(:update) }
        it { expect(lesson.reload.name).not_to eq name }
      end
    end
  end
end
