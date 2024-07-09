# frozen_string_literal: true

require "rails_helper"

RSpec.describe Marketing::Footer, type: :component do
  subject { render_inline described_class.new }

  it { is_expected.to have_link(href: "#") }
end
