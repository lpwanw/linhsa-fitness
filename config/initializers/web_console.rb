# frozen_string_literal: true

if Rails.env.production?
  WebConsole::View.class_eval do
    def render(*)
      super
    end
  end

  Rails.application.configure do
    config.web_console.permissions = ENV.fetch("CONSOLE_ALLOW_IPS", "").split
  end
end
