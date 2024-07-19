# frozen_string_literal: true

task create_admin_account: :environment do
  email = "phuongtay2000@gmail.com"

  return if User.find_by(email:)

  user = User.create(email:, password: SecureRandom.hex, confirmed_at: Time.current)
  user.add_role(UserRoles.admin)
end
