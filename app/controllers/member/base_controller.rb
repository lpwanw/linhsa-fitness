# frozen_string_literal: true

class Member::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_member_role!
end
