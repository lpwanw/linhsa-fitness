# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    let(:current_user) { create(:user, :admin) }

    it_behaves_like "authenticate_admin_role!"

    before { sign_in current_user }

    context "when it response" do
      before { subject }

      it { expect(response).to have_http_status(:successful) }
      it { expect(response).to render_template(:new) }
    end
  end
end
