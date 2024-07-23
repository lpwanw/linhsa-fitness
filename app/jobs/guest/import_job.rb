# frozen_string_literal: true

require "csv"

class Guest::ImportJob < ApplicationJob
  queue_as :default

  def perform(import_file) # rubocop:disable Metrics/MethodLength
    import_file.processing!

    data = import_file.file.download

    csv = CSV.new(data, headers: true)
    total_count = CSV.new(data, headers: true).count
    process_percent = 0
    count = 0
    csv.each do |row|
      count += 1
      percent = ((count)*100) / total_count
      create_guest(row.to_h.with_indifferent_access)
      next if percent <= process_percent

      process_percent = percent
      Turbo::StreamsChannel.broadcast_replace_to(
        "import_guest_#{import_file.id}",
        target: "progress_bar",
        partial: "admin/import_guests/import_progress",
        locals: { percent: process_percent }
      )
    end
  end

  def create_guest(row)
    guest = Guest.find_or_initialize_by(phone: row[:phone])
    guest.assign_attributes(row.slice(:name, :note, :free_time))
    guest.save!
  end
end
