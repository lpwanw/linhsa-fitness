# frozen_string_literal: true

module ApplicationHelper
  def current_page_params
    request.params.slice("q", "filter", "sort")
  end

  def render_turbo_flash_messages
    turbo_stream.prepend "flash", partial: "shared/flash"
  end
end
