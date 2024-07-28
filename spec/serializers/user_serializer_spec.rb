# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSerializer do
  subject(:json) { serializer.to_hash }

  let(:user) { create(:user) }
  let(:serializer) { described_class.new user }

  it { expect(json[:id]).to eq user.id }
  it { expect(json[:email]).to eq user.email }

  context "when user have member" do
    it { expect(json[:roles]).to eq [:member] }
  end

  context "when user have admin role" do
    let(:user) { create(:user, :admin) }

    it { expect(json[:roles]).to eq %i[member admin] }
  end

  context "when user have teacher role" do
    let(:user) { create(:user, :teacher) }

    it { expect(json[:roles]).to eq %i[member teacher] }
  end
end
