# frozen_string_literal: true

require "rails_helper"

RSpec.describe Navbar, type: :component do
  subject { render_inline(described_class.new) }

  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  it { is_expected.to have_css("span.block.text-sm.text-gray-500.truncate", text: user.email) }
end
