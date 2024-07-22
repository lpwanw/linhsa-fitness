# frozen_string_literal: true

class Admin::ImportGuestsController < Admin::BaseController
  def index
    @q = ImportFile.ransack(params[:q])
    scope = @q.result(distinct: true)
    @pagy, @import_files = pagy(scope)
  end

  def new; end

  def create
    @import_file = ImportFile.new(import_file_params.merge(model: Guest.name))
    if @import_file.save
      flash.now[:notice] = t(".success")
      redirect_to admin_import_guests_path
    else
      flash.now[:alert] = t(".failed")
    end
  end

  private

  def import_file_params
    params.required(:import_file).permit(:name, :file)
  end
end
