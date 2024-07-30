# frozen_string_literal: true

class Api::Admin::UsersController < Api::Admin::BaseController
  def index
    @q = User.includes(:roles).ransack(params[:q])
    scope = @q.result(distinct: true)
    @pagy, @users = pagy(scope)
    render json: @users
  end
end
