# frozen_string_literal: true

class Teacher::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_teacher_role!
end
