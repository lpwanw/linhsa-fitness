# frozen_string_literal: true

require "rails_helper"

RSpec.describe Guest::ImportJob, type: :job do
  let(:import_file) { create(:import_file) }
  let(:csv_content) do
    "phone,name,note,free_time\n" \
      "0987654321,Jane Doe,Note 2,11:00 AM\n" \
      "1234567890,John Doe,Note 1,10:00 AM"
  end

  before do
    allow(import_file).to receive(:file).and_return(double(download: csv_content))
    allow(import_file).to receive(:processing!)
    allow(import_file).to receive(:completed!)
    allow(Turbo::StreamsChannel).to receive(:broadcast_replace_to)
  end

  describe "#perform" do
    it do
      expect { described_class.perform_now(import_file) }.to change { Guest.count }.by(1)
    end

    it "marks the import file as processing and completed" do
      described_class.perform_now(import_file)
      expect(import_file).to have_received(:processing!).ordered
      expect(import_file).to have_received(:completed!).ordered
    end

    it "broadcasts progress updates" do
      described_class.perform_now(import_file)
      expect(Turbo::StreamsChannel).to have_received(:broadcast_replace_to).at_least(:once).with(
        "import_guest_#{import_file.id}",
        target: "progress_bar",
        partial: "admin/import_guests/import_progress",
        locals: { percent: kind_of(Numeric) }
      )
    end
  end
end
