# frozen_string_literal: true

require "rails_helper"

RSpec.describe Role, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:users) }
  end
end
