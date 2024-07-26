# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:current_user) { create(:user, :admin) }

    it_behaves_like "authenticate_admin_role!"
  end
end
