# frozen_string_literal: true

class Admin::ImportGuestsController < Admin::BaseController
  before_action :load_import_file, only: %i[show]

  def index
    @q = ImportFile.ransack(params[:q])
    scope = @q.result(distinct: true)
    @pagy, @import_files = pagy(scope)
  end

  def show; end

  def new; end

  def create
    @import_file = ImportFile.new(import_file_params.merge(model: Guest.name))
    if @import_file.save
      flash[:notice] = t(".success")
      redirect_to admin_import_guest_path(@import_file)
    else
      flash.now[:alert] = t(".failed")
    end
  end

  private

  def import_file_params
    params.required(:import_file).permit(:name, :file)
  end

  def load_import_file
    @import_file = ImportFile.guest.find_by id: params[:id]

    return if @import_file

    redirect_to admin_import_guests_path, alert: t("errors.messages.not_found")
  end
end
