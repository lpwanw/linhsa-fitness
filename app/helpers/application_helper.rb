# frozen_string_literal: true

module ApplicationHelper
  def current_page_params
    request.params.slice("query", "filter", "sort")
  end
end
