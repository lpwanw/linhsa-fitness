# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "GET #edit" do
    subject { get :edit, params: { id: } }

    let(:current_user) { create(:user, :admin) }
    let(:course) { create(:course, creator: current_user) }
    let(:id) { course.id }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when invalid id" do
      let(:id) { "invalid_id" }

      before { subject }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:alert]).to eq "không tìm thấy" }
      it { expect(response).to redirect_to(root_path) }
    end

    context "when it response for html" do
      before { subject }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(assigns[:course]).to eq course }
      it { expect(response).to redirect_to(admin_course_path(course)) }
    end

    context "when it response for turbo_stream" do
      subject { get :edit, params: { id: } }

      before do
        request.headers.merge!({ "Turbo-Frame": :name })
        subject
      end

      it { expect(response).to have_http_status(:successful) }
      it { expect(assigns[:course]).to eq course }
      it { expect(response).to render_template(:edit) }
    end
  end
end
