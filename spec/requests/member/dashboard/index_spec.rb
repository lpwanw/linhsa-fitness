# frozen_string_literal: true

require "rails_helper"

RSpec.describe Member::DashboardController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:current_user) { create(:user) }

    it_behaves_like "authenticate_member_role!"
  end
end
