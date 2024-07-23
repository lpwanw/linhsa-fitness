# frozen_string_literal: true

Rails.application.configure do
  unless Rails.env.test?
    config.web_console.development_only = false
  end
end
