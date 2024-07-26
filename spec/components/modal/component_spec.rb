# frozen_string_literal: true

require "rails_helper"

RSpec.describe Modal::Component, type: :component do
  subject { render_inline described_class.new title:, show:, id: }

  let(:title) { FFaker::Lorem.sentence }
  let(:show) { true }
  let(:id) { "default" }

  it { is_expected.to have_text title }
end
