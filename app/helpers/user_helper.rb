# frozen_string_literal: true

module UserHelper
  def avatar_for(user)
    user.profile_avatar&.attached? ? user.profile_avatar : "default_avatar.png"
  end
end
