# frozen_string_literal: true

require "rails_helper"

RSpec.describe Badge::ImportFile::Status, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new status: }

  context "when status is created" do
    let(:status) { :created }
    let(:css) do
      "span.whitespace-nowrap.bg-yellow-100.text-yellow-800.text-xs.font-medium.me-2" \
        ".px-2\\.5.py-0\\.5.rounded.dark\\:bg-yellow-900.dark\\:text-yellow-300"
    end

    it { is_expected.to have_css(css, text: "mới") }
  end

  context "when status is processing" do
    let(:status) { :processing }
    let(:css) do
      "span.whitespace-nowrap.bg-blue-100.text-blue-800.text-xs.font-medium.me-2" \
        ".px-2\\.5.py-0\\.5.rounded.dark\\:bg-blue-900.dark\\:text-blue-300"
    end

    it { is_expected.to have_css(css, text: "đang xử lý") }
  end

  context "when status is completed" do
    let(:status) { :completed }
    let(:css) do
      "span.whitespace-nowrap.bg-green-100.text-green-800.text-xs.font-medium.me-2" \
        ".px-2\\.5.py-0\\.5.rounded.dark\\:bg-green-900.dark\\:text-green-300"
    end

    it { is_expected.to have_css(css, text: "hoàn thành") }
  end
end
