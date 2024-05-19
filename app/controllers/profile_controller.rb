# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile || current_user.build_profile
    if @profile.update(profile_params)
      redirect_to profile_path, notice: I18n.t("profile.update.success"), status: :see_other
    else
      flash[:error] = I18n.t("profile.update.failure")
      render :show, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :dob, :avatar)
  end
end
