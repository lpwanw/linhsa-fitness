# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  def index
    @pagy, @users = pagy(User.preload(:roles))
  end
end
