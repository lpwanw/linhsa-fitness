# frozen_string_literal: true

class GuestsController < ApplicationController
  before_action :authenticate_turbo_frame_request!, only: %i[new]
  def new; end

  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      flash.now[:notice] = t(".success")
    else
      flash.now[:alert] = t(".failed")
    end
  end

  private

  def guest_params
    params.required(:guest).permit(:name, :phone, :note, :free_time)
  end

  def authenticate_turbo_frame_request!
    return if turbo_frame_request?

    # TODO: make not found page
    render file: Rails.public_path.join("404.html").to_s, layout: false, status: :not_found, formats: [:html]
  end
end
