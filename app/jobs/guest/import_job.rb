# frozen_string_literal: true

require "csv"

class Guest::ImportJob < ApplicationJob
  queue_as :default

  def perform(import_file) # rubocop:disable Metrics/MethodLength
    @import_file = import_file
    @import_file.processing!

    csv = CSV.new(data, headers: true)
    process_percent = 0
    count = 0
    csv.each do |row|
      count += 1
      percent = (count * 100) / total_count
      create_guest(row)
      next if percent <= process_percent

      process_percent = percent
      broadcast_progress_bar(process_percent)
    end

    import_file.completed!
  end

  private

  attr_reader :import_file

  def create_guest(row)
    hash = row.to_h.with_indifferent_access
    guest = Guest.find_or_initialize_by(phone: hash[:phone])
    guest.assign_attributes(hash.slice(:name, :note, :free_time).merge(skip_notify_admin: true))
    guest.save
    guest
  end

  def total_count
    @total_count ||= CSV.new(data, headers: true).count
  end

  def data
    @data ||= import_file.file.download
  end

  def broadcast_progress_bar(percent)
    Turbo::StreamsChannel.broadcast_replace_to(
      "import_guest_#{import_file.id}",
      target: "progress_bar",
      partial: "admin/import_guests/import_progress",
      locals: { percent: }
    )
  end
end
