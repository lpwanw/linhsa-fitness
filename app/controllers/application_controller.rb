# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  around_action :switch_locale

  helper_method :current_role

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def after_sign_in_path_for(_)
    return admin_root_path if current_user.admin?
    return teacher_root_path if current_user.teacher?

    app_path
  end

  UserRoles.roles.each do |role|
    define_method("authenticate_#{role}_role!") do
      return if current_user&.public_send("#{role}?")

      # TODO: handle member
      sign_out current_user
      redirect_to new_user_session_path, alert: t("devise.sessions.signed_out")
    end
  end

  def current_role
    role = self.class.name.split("::").first.downcase

    return if UserRoles.roles.exclude?(role.to_sym)

    role
  end
end
