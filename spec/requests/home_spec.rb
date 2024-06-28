# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe HomeController, type: :controller do
  describe "GET /index" do
    let!(:user) { create(:user) }

    before do
      sign_in user
      get :index
    end

    it { expect(response).to have_http_status(:ok) }
  end
end
