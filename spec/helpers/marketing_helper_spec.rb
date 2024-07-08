# frozen_string_literal: true

require "rails_helper"

RSpec.describe MarketingHelper, type: :helper do
  describe "#marketing_navigations" do
    subject { helper.marketing_navigations }

    it { is_expected.to be_an(Array) }
    it { is_expected.to all(be_a(Hash)) }
    it do
      is_expected.to(
        eq(
          [
            {
              link: root_path,
              name: :clubs,
            }, {
              link: root_path,
              name: :calendars,
            }, {
              link: root_path,
              name: :courses,
            }, {
              link: root_path,
              name: :prices,
            }, {
              link: root_path,
              name: :about,
            },
          ]
        )
      )
    end
  end
end
