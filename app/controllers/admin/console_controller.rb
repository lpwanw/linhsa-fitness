# frozen_string_literal: true

class Admin::ConsoleController < Admin::BaseController
  layout "devise"
  http_basic_authenticate_with name: ENV.fetch("CONSOLE_USER"), password: ENV.fetch("CONSOLE_PASSWORD"), only: :show

  def show
    console
  end
end
