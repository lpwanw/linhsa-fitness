# frozen_string_literal: true

module Role::Ransack
  extend ActiveSupport::Concern

  included do
    def self.ransackable_attributes(_auth_object = nil)
      ["name"]
    end
  end
end
