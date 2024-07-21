# frozen_string_literal: true

module Guest::Ransack
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(_auth_object = nil)
      %w[name status phone]
    end

    def self.ransackable_associations(_auth_object = nil)
      []
    end
  end
end
