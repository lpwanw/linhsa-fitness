# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flash::Component, type: :component do
  subject { render_inline component }

  let(:component) { described_class.new flash_type, message }
  let(:message) { FFaker::Lorem.sentence }
  let(:flash_type) { :alert }

  it { is_expected.to have_text message }

  describe "#html_class" do
    subject { component.send(:html_class) }

    context "when type is alert" do
      let(:flash_type) { :alert }

      it { is_expected.to eq "text-red-500 bg-red-100 dark:bg-red-800 dark:text-red-200" }
    end

    context "when type is any" do
      let(:flash_type) { :random }

      it { is_expected.to eq "text-green-500 bg-green-100 dark:bg-green-800 dark:text-green-200" }
    end
  end
end
