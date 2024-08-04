# frozen_string_literal: true

class Admin::CoursesController < Admin::BaseController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params.merge(creator: current_user)

    if @course.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.required(:course).permit(:name, :description)
  end
end
