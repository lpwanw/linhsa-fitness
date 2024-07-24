# frozen_string_literal: true

class Admin::GuestsController < Admin::BaseController
  def index
    @q = Guest.ransack(params[:q])
    scope = @q.result(distinct: true)
    @pagy, @guests = pagy(scope)
  end
end
