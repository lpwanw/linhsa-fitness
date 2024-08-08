# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:current_user) { create(:user, :admin) }
    let!(:course) { create(:course, creator: current_user) }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when it response" do
      before { subject }

      it { expect(response).to have_http_status(:successful) }
      it { expect(assigns[:courses]).to eq [course] }
      it { expect(response).to render_template(:index) }
    end
  end
end
