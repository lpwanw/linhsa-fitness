# frozen_string_literal: true

require "rails_helper"

RSpec.describe KeepMeAliveJob, type: :job do
  describe "#perform" do
    let(:host_url) { "http://example.com" }
    let(:url_with_params) { "#{host_url}?from_cron" }

    before do
      stub_const("ENV", { "HOST_URL" => host_url })
      stub_request(:get, url_with_params).to_return(status: 200)
    end

    it "sends a GET request to the host URL with query params" do
      described_class.perform_now
      expect(WebMock).to have_requested(:get, url_with_params).once
    end
  end
end
