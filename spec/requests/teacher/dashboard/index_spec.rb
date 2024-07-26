# frozen_string_literal: true

require "rails_helper"

RSpec.describe Teacher::DashboardController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    let(:current_user) { create(:user, :teacher) }

    it_behaves_like "authenticate_teacher_role!"
  end
end
