# frozen_string_literal: true

class Api::BaseController < ApplicationController
  before_action :authenticate_api_user!

  private

  def authenticate_api_user!
    return if current_user

    # TODO: handle API Error
    json_response "Unauthorized", status: :unauthorized
  end

  def json_response(data, status: :ok)
    render json: { data:, success: true }, status:
  end
end
