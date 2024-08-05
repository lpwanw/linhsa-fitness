# frozen_string_literal: true

class Admin::CoursesController < Admin::BaseController
  before_action :load_course, only: %i[show edit update]

  def show; end

  def new
    @course = Course.new
  end

  def edit
    return redirect_to admin_course_path(@course) unless turbo_frame_request?

    @course.assign_attributes(update_course_params)
  end

  def create
    @course = Course.new course_params.merge(creator: current_user)

    if @course.save
      flash[:notice] = t ".success"
      redirect_to admin_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @course.assign_attributes(update_course_params)
    if @course.save
      flash[:notice] = t ".Success"
    else
      flash.now[:alert] = t ".Failed"
      @course.reload
    end
  end

  private

  def course_params
    params.required(:course).permit(:name, :description)
  end

  def update_course_params
    params.fetch(:course, {}).permit(:name, :description)
  end

  def load_course
    @course = Course.find_by(id: params[:id])

    return if @course

    flash[:alert] = t "errors.messages.not_found"
    redirect_to root_path
  end
end
