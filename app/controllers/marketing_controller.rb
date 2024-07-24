# frozen_string_literal: true

class MarketingController < ApplicationController
  before_action :redirect_signed_in_user, only: %i[index]

  def index; end

  private

  def redirect_signed_in_user
    return unless current_user

    redirect_to after_sign_in_path_for(current_user)
  end
end
