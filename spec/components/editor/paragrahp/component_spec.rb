# frozen_string_literal: true

require "rails_helper"

RSpec.describe Editor::Paragraph::Component, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new block }
  let(:block) do
    {
      type: "paragraph",
      data: {
        text: "<a href=\"#{href}\">There is something else</a>",
      },
    }
  end
  let(:href) { "http://localhost:3000" }

  context "when it render external link" do
    it { is_expected.to have_link(href: "http://localhost:3000", target: "_blank") }
  end

  context "when it render internal link" do
    let(:href) { "/" }

    it { is_expected.to have_link(href: "/", target: "_top") }
  end
end
