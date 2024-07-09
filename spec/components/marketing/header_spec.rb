# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe Marketing::Header, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new }

  it { is_expected.to have_link(href: "/") }
end
