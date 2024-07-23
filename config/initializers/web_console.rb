# frozen_string_literal: true

if Rails.env.production?
  WebConsole::View.class_eval do
    def render(*)
      super
    end
  end
end
