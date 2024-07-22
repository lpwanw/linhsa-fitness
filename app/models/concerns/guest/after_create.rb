# frozen_string_literal: true

module Guest::AfterCreate
  extend ActiveSupport::Concern

  included do
    attr_accessor :skip_notify_admin

    after_create :notify_admin, unless: :skip_notify_admin
  end

  private

  def notify_admin
    GuestMailer.notify_admin(self).deliver_later
  end
end
