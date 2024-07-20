# frozen_string_literal: true

module RoleHelper
  def role_root_path(role = nil)
    role = current_role if UserRoles.roles.exclude?(role&.to_sym)

    public_send("#{role}_root_path")
  end
end
