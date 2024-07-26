# frozen_string_literal: true

require "rails_helper"

RSpec.describe GuestsController, type: :controller do
  describe "GET #new" do
    context "when the request is a turbo frame request" do
      before do
        request.headers["Turbo-Frame"] = "some_frame"
        get :new
      end

      it { expect(response).to be_successful }
      it { expect(response).to render_template :new }
    end

    context "when the request is not a turbo frame request" do
      before { get :new }

      it { expect(response).to have_http_status(:not_found) }
    end
  end
end
