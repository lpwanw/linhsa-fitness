# frozen_string_literal: true

module User::Roles
  extend ActiveSupport::Concern

  included do
    rolify

    after_create :assign_default_role
  end

  def assign_default_role
    add_role(UserRoles.member) if roles.blank?
  end

  UserRoles.roles.each do |role|
    define_method("#{role}?") do
      has_role? role
    end
  end

  def assigned_user_roles
    UserRoles.roles & User.last.roles.map(&:name).map(&:to_sym)
  end
end
