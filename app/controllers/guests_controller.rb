# frozen_string_literal: true

class GuestsController < ApplicationController
  before_action :authenticate_turbo_frame_request!, only: %i[new]
  def new; end

  def create; end

  private

  def authenticate_turbo_frame_request!
    return if turbo_frame_request?

    # TODO: make not found page
    render file: Rails.public_path.join("404.html").to_s, layout: false, status: :not_found, formats: [:html]
  end
end
