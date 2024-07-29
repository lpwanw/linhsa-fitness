# frozen_string_literal: true

class Api::Admin::BaseController < Api::BaseController
  before_action :authenticate_api_admin!

  private

  def authenticate_api_admin!
    return if current_user&.admin?

    # TODO: handle API Error
    json_response "Unauthorized", status: :unauthorized
  end
end
