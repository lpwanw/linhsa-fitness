# frozen_string_literal: true

class Modal::Component < BaseComponent
  def initialize(title:, show:, id: "default-modal")
    @title = title
    @show = show
    @id = id
    super()
  end

  private

  attr_reader :title, :show, :id

  def show?
    show.present?
  end
end
