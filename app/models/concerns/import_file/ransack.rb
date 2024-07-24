# frozen_string_literal: true

module ImportFile::Ransack
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(_auth_object = nil)
      %w[name status]
    end

    def self.ransackable_associations(_auth_object = nil)
      []
    end
  end
end
