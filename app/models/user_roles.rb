# frozen_string_literal: true

class UserRoles
  ROLES = %i[member teacher admin].freeze

  class << self
    ROLES.each do |role|
      define_method(role) do
        role
      end
    end

    def roles
      ROLES
    end
  end
end
