# frozen_string_literal: true

class Api::BaseController < ApplicationController
  before_action :authenticate_api_user!
  after_action :add_pagy

  private

  def authenticate_api_user!
    return if current_user

    # TODO: handle API Error
    json_response "Unauthorized", status: :unauthorized
  end

  def json_response(data, status: :ok)
    render json: { data:, success: true }, status:
  end

  def add_pagy
    pagy_headers_merge(@pagy) if @pagy
  end
end
