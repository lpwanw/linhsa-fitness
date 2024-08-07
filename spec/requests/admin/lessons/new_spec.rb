# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::LessonsController, type: :controller do
  describe "GET #new" do
    subject { get :new, params: { course_id: } }

    let(:current_user) { create(:user, :admin) }
    let(:course) { create(:course, creator: current_user) }
    let(:course_id) { course.id }

    it_behaves_like "authenticate_admin_role!"

    before do
      request.headers.merge!({ "Turbo-Frame": :modal })
      sign_in current_user
    end

    context "when invalid id" do
      let(:course_id) { "invalid_id" }

      before { subject }

      it { expect(response).to have_http_status(:not_found) }
    end

    context "when it response" do
      before { subject }

      it { expect(response).to have_http_status(:successful) }
      it { expect(assigns[:course]).to eq course }
      it { expect(response).to render_template(:new) }
    end
  end
end
