# frozen_string_literal: true

if Rails.env.production?
  Rails.application.configure do
    config.web_console.permissions = ENV.fetch("CONSOLE_ALLOW_IPS", "").split
  end
end
