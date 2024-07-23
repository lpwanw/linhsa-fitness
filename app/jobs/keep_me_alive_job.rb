# frozen_string_literal: true

class KeepMeAliveJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Faraday.get("#{ENV.fetch('HOST_URL')}?from_cron")
  end
end
