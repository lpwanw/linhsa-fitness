# frozen_string_literal: true

require "rails_helper"

RSpec.describe MarketingController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    before { subject }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:index, layout: "layouts/marketing") }
  end
end
