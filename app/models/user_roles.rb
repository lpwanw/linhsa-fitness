# frozen_string_literal: true

class UserRoles
  ROLES = %i[member teacher admin].freeze
  ROLES_COLORS = {
    member: :blue,
    teacher: :indigo,
    admin: :green,
  }.freeze

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
