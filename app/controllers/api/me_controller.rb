# frozen_string_literal: true

class Api::MeController < Api::BaseController
  def index
    render json: current_user
  end
end
