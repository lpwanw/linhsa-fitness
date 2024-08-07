# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::LessonsController, type: :controller do
  describe "POST #create" do
    subject { post :create, params:, format: :turbo_stream }

    let(:current_user) { create(:user, :admin) }
    let(:course) { create(:course, creator: current_user) }
    let(:course_id) { course.id }
    let(:params) do
      {
        lesson: {
          name:,
        },
        course_id:,
      }
    end
    let(:name) { FFaker::Company.name }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when valid params" do
      context "when it change ImportFile count" do
        it { expect { subject }.to change(Lesson, :count).by(1) }
      end

      context "when it redirect" do
        let(:last_record) { Lesson.last }

        before { subject }

        it { expect(flash[:notice]).to eq(I18n.t("admin.lessons.create.Success")) }
        it { expect(response).to have_http_status(:successful) }
        it { expect(response).to render_template(:create) }
        it { expect(last_record.name).to eq name }
      end
    end

    context "when invalid params" do
      let(:name) { "" }

      context "when it not change ImportFile count" do
        it { expect { subject }.not_to change(Lesson, :count) }
      end

      context "when render create" do
        before { subject }

        it { expect(response).to have_http_status(:successful) }
        it { expect(response).to render_template(:create) }
      end
    end
  end
end
