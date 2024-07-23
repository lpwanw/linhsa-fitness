# frozen_string_literal: true

module ImportFile::AfterCreate
  extend ActiveSupport::Concern

  included do
    after_create :import_file
  end

  private

  def import_file
    Guest::ImportJob.perform_later(self)
  end
end
