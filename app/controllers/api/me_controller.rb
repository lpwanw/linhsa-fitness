# frozen_string_literal: true

class Api::MeController < Api::BaseController
  def index
    json_response UserSerializer.new(current_user)
  end
end
