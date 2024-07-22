# frozen_string_literal: true

class GuestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.guest_mailer.notify_admin.subject
  #
  def notify_admin(guest)
    @guest = guest

    mail to: "phuongtay2000@gmail.com"
  end
end
