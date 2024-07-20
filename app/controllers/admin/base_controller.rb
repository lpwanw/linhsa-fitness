# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :authenticate_admin_role!
end
