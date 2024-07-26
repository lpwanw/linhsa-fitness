# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ImportGuestsController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    let(:current_user) { create(:user, :admin) }

    it_behaves_like "authenticate_admin_role!"
  end
end
