# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def after_sign_in_path_for(_)
    member_dashboard_index_path
  end

  UserRoles.roles.each do |role|
    define_method("authenticate_#{role}_role!") do
      return if current_user&.public_send("#{role}?")

      # TODO: handle member
      sign_out current_user
      redirect_to new_user_session_path, alert: t("devise.sessions.signed_out")
    end
  end
end
