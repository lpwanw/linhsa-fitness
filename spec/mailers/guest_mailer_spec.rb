# frozen_string_literal: true

require "rails_helper"

RSpec.describe GuestMailer, type: :mailer do
  describe "#notify_admin" do
    let(:subject) { described_class.notify_admin(guest) }
    let(:guest) { create(:guest) }

    it { expect(subject.subject.to_s).to eq "Notify admin" }
    it { expect(subject.to).to eq ["phuongtay2000@gmail.com"] }
    it { expect(subject.from).to eq ["from@example.com"] }
  end
end
