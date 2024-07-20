# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_page_params
    request.params.slice("query", "filter", "sort")
  end

  def render_turbo_flash_messages
    turbo_stream.prepend "flash", partial: "shared/flash"
  end
end
