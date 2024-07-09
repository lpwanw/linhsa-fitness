# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserRoles do
  UserRoles.roles.each do |role|
    describe ".#{role}" do
      subject { described_class.public_send(role) }

      it { is_expected.to eq role }
    end
  end

  describe ".roles" do
    subject { described_class.roles }

    it { is_expected.to eq %i[member teacher admin] }
  end
end
