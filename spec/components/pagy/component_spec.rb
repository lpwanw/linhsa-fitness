# frozen_string_literal: true

require "rails_helper"

RSpec.describe Pagy::Component, type: :component do
  subject { render_inline described_class.new pagy }

  let(:pagy) { Pagy.new(count: count, page: 1) }
  let(:count) { 20 }

  context "when render pagy" do
    it { is_expected.to have_css(".pagy") }
  end

  context "when render empty" do
    let(:count) { 0 }

    it { is_expected.to have_text "Không có kết quả" }
  end

  context "when render count not pagy" do
    let(:count) { rand(1..9) }

    it { is_expected.to have_text "Tổng cộng" }
  end
end
