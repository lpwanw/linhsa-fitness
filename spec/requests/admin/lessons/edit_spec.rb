# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::LessonsController, type: :controller do
  describe "GET #edit" do
    subject { get :edit, params: { course_id:, id: } }

    let(:current_user) { create(:user, :admin) }
    let(:course) { create(:course, creator: current_user) }
    let(:lesson) { create(:lesson, course:) }
    let(:course_id) { course.id }
    let(:id) { lesson.id }

    it_behaves_like "authenticate_admin_role!"

    before do
      request.headers.merge!({ "Turbo-Frame": :modal })
      sign_in current_user
    end

    context "when invalid id" do
      let(:id) { "invalid_id" }

      before { subject }

      it { expect(response).to have_http_status(:not_found) }
    end

    context "when it response" do
      before { subject }

      it { expect(response).to have_http_status(:successful) }
      it { expect(assigns[:course]).to eq course }
      it { expect(assigns[:lesson]).to eq lesson }
      it { expect(response).to render_template(:edit) }
    end
  end
end
