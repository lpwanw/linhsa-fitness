# frozen_string_literal: true

class Admin::LessonsController < Admin::BaseController
  before_action :authenticate_turbo_frame_request!, only: %i[new]
  before_action :load_course, only: %i[new create]

  def new
    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      flash.now[:notice] = t(".Success")
    else
      flash.now[:alert] = t(".Failed")
    end
  end

  private

  def load_course
    @course = Course.find_by(id: params[:course_id])

    return if @course

    render404
  end

  def lesson_params
    params.required(:lesson).permit(:name, :content, :video)
  end
end
