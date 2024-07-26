# frozen_string_literal: true

require "rails_helper"

RSpec.describe Badge::Component, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new text:, color: }
  let(:text) { FFaker::Lorem.sentence }
  let(:color) { Badge::Component::COLORS.sample }

  context "when color is blue" do
    let(:color) { :blue }
    let(:css) do
      "span.whitespace-nowrap.bg-blue-100.text-blue-800.text-xs.font-medium.me-2" \
        ".px-2\\.5.py-0\\.5.rounded.dark\\:bg-blue-900.dark\\:text-blue-300"
    end

    it { is_expected.to have_css(css, text:) }
  end
end
