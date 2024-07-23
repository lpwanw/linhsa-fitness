# frozen_string_literal: true

Rails.application.configure do
  config.web_console.development_only = Rails.env.test?
end
