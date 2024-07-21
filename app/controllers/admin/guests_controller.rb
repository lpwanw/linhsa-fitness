# frozen_string_literal: true

class Admin::GuestsController < Admin::BaseController
  def index
    @q = Guest.ransack(params[:q])
    scope = @q.result(distinct: true)
    @pagy, @guests = pagy(scope)
  end

  def import

  end

  def upload_csv
    Guest::ImportJob.perform_later
    render "upload_csv", status: :accepted
  end
end
