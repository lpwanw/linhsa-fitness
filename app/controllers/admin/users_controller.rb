# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  def index
    @users = User.preload(:roles)
  end
end
