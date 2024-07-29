# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::Admin::UsersController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:current_user) { create(:user, :admin) }

    context "when not sign_in" do
      before { subject }

      it { expect(json_body[:data]).to eq "Unauthorized" }
      it { expect(json_body[:success]).to be_truthy }
      it { expect(response).to have_http_status :unauthorized }
    end

    context "when signed_in" do
      before do
        sign_in current_user
        subject
      end

      context "when user do not admin have role" do
        let(:current_user) { create(:user, :teacher) }

        it { expect(json_body[:data]).to eq "Unauthorized" }
        it { expect(json_body[:success]).to be_truthy }
        it { expect(response).to have_http_status :unauthorized }
      end
    end

    context "when response ok" do
      let!(:users) { create_list(:user, 10) }

      before do
        sign_in current_user
        subject
      end

      it { expect(json_body[:data].count).to eq 10 }
      it { expect(response.headers["Current-Page"]).to eq "1" }
      it { expect(response.headers["Page-Items"]).to eq "10" }
      it { expect(response.headers["Total-Count"]).to eq "11" }
      it { expect(response.headers["Total-Pages"]).to eq "2" }
    end
  end
end
