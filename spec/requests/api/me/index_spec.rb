# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::MeController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:current_user) { create(:user) }

    context "when not sign_in" do
      before { subject }

      it { expect(json_body[:data]).to eq "Unauthorized" }
      it { expect(json_body[:success]).to be_truthy }
      it { expect(response).to have_http_status :unauthorized }
    end

    context "when signed in" do
      before do
        sign_in current_user
        subject
      end

      context "when user have member" do
        it { expect(json_data[:id]).to eq current_user.id }
        it { expect(json_data[:email]).to eq current_user.email }
        it { expect(json_data[:roles]).to eq ["member"] }
      end

      context "when user have admin role" do
        let(:current_user) { create(:user, :admin) }

        it { expect(json_data[:id]).to eq current_user.id }
        it { expect(json_data[:email]).to eq current_user.email }
        it { expect(json_data[:roles]).to eq %w[member admin] }
      end

      context "when user have teacher role" do
        let(:current_user) { create(:user, :teacher) }

        it { expect(json_data[:id]).to eq current_user.id }
        it { expect(json_data[:email]).to eq current_user.email }
        it { expect(json_data[:roles]).to eq %w[member teacher] }
      end
    end
  end
end
