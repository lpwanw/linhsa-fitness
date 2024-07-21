# frozen_string_literal: true

class Guest::ImportJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Begin
    sleep(10)
    Rails.logger.info "Begin"
    Turbo::StreamsChannel.broadcast_replace_to(
      "guests_csv_upload_stream",
      target: "guests_csv_upload_status",
      partial: "admin/guests/upload_status", locals: { text: "Running", color: :yellow }
    )
    # Running
    sleep(10)
    Rails.logger.info "Running"
    Turbo::StreamsChannel.broadcast_replace_to(
      "guests_csv_upload_stream",
      target: "guests_csv_upload_status",
      partial: "admin/guests/upload_status", locals: { text: "Importing", color: :blue }
    )
    # Done
    sleep(10)
    Rails.logger.info "Done"
    Turbo::StreamsChannel.broadcast_replace_to(
      "guests_csv_upload_stream",
      target: "guests_csv_upload_status",
      partial: "admin/guests/upload_status", locals: { text: "Done", color: :green }
    )
  end
end
