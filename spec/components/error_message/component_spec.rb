# frozen_string_literal: true

require "rails_helper"

RSpec.describe ErrorMessage::Component, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new object, :name }
  let(:object) do
    course = build(:course, name: "")
    course.valid?
    course
  end

  context "when it render nothing" do
    let(:object) { build(:course) }

    it { is_expected.to have_no_css(".mt-2.text-sm.text-red-600.dark\\:text-red-500") }
  end

  context "when it render error" do
    it { is_expected.to have_css(".mt-2.text-sm.text-red-600.dark\\:text-red-500") }
    it { is_expected.to have_text("Name") }
  end
end
