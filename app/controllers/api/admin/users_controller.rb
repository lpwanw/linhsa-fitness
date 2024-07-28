# frozen_string_literal: true

class Api::Admin::UsersController < Api::Admin::BaseController
  def index
    @q = User.ransack(params[:q])
    scope = @q.result(distinct: true).preload(:roles)
    @pagy, @users = pagy(scope)

    json_response collection_serializer(@users, UserSerializer)
  end
end
