# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#current_page_params" do
    it do
      allow(helper).to receive(:request).and_return(
        double(params: {
                 "q" => "search_term",
                 "filter" => "some_filter",
                 "sort" => "arc",
                 "other" => "other_params",
               })
      )
      expect(helper.current_page_params).to eq({
                                                 "q" => "search_term",
                                                 "filter" => "some_filter",
                                                 "sort" => "arc",
                                               })
    end
  end
  describe "#render_turbo_flash_messages" do
    it do
      expect(helper.render_turbo_flash_messages).to(
        include("<turbo-stream action=\"prepend\" target=\"flash\"><template></template></turbo-stream>")
      )
    end
  end
end
