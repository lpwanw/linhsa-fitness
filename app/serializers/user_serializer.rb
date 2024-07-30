# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :email, :roles

  def roles
    object.assigned_user_roles
  end
end
