# frozen_string_literal: true

RSpec.shared_context "authenticate_admin_role!", shared_context: :metadata do
  before do
    sign_in current_user
    subject
  end

  context "when user_role is teacher" do
    let(:current_user) { create(:user, :teacher) }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(new_user_session_path) }
  end

  context "when user_role is member" do
    let(:current_user) { create(:user) }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(new_user_session_path) }
  end

  describe "#current_role" do
    it { expect(controller.send(:current_role)).to eq "admin" }
  end
end

RSpec.shared_context "authenticate_member_role!", shared_context: :metadata do
  before do
    sign_in current_user
    subject
  end

  context "when user_role is teacher" do
    let(:current_user) { create(:user, :no_role, :teacher) }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(new_user_session_path) }
  end

  context "when user_role is admin" do
    let(:current_user) { create(:user, :no_role, :admin) }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(new_user_session_path) }
  end

  describe "#current_role" do
    it { expect(controller.send(:current_role)).to eq "member" }
  end
end

RSpec.shared_context "authenticate_teacher_role!", shared_context: :metadata do
  before do
    sign_in current_user
    subject
  end

  context "when user_role is admin" do
    let(:current_user) { create(:user, :admin) }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(new_user_session_path) }
  end

  context "when user_role is member" do
    let(:current_user) { create(:user) }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(response).to redirect_to(new_user_session_path) }
  end

  describe "#current_role" do
    it { expect(controller.send(:current_role)).to eq "teacher" }
  end
end
