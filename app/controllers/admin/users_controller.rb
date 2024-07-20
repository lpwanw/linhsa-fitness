# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  def index
    @q = User.ransack(params[:q])
    scope = @q.result(distinct: true).preload(:roles)
    @pagy, @users = pagy(scope)
  end
end
