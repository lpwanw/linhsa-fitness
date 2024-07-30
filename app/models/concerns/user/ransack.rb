# frozen_string_literal: true

module User::Ransack
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(_auth_object = nil)
      %w[id email]
    end

    def self.ransackable_associations(_auth_object = nil)
      ["roles"]
    end
  end
end
