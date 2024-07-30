# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  def index
    @q = User.includes(:roles).ransack(params[:q])
    scope = @q.result(distinct: true)
    @pagy, @users = pagy(scope)
  end
end
