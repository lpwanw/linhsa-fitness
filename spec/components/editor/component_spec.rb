# frozen_string_literal: true

require "rails_helper"

RSpec.describe Editor::Component, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new data }
  let(:data) do
    {
      blocks: [
        {
          type: "paragraph",
          data: {
            text: "<a href=\"http://localhost:3000\">There is something else</a>",
          },
        },
      ],
    }.to_json
  end

  context "when it render content" do
    it { is_expected.to have_text("There is something else") }
    it { is_expected.to have_link(href: "http://localhost:3000", target: "_blank") }
  end
end
