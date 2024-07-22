# frozen_string_literal: true

module ImportFile::BeforeValidation
  extend ActiveSupport::Concern

  included do
    before_validation :authenticate_name
  end

  private

  def authenticate_name
    return if name.present?

    self.name = "#{Time.current.to_i}_#{SecureRandom.hex}_#{model}"
  end
end
