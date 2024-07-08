# frozen_string_literal: true

module MarketingHelper
  def marketing_navigations # rubocop:disable Metrics/MethodLength
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
  end
end
