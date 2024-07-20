# frozen_string_literal: true

class Pagy::Component < BaseComponent
  include Pagy::Frontend

  delegate :count, :from, :to, to: :pagy

  def initialize(pagy)
    @pagy = pagy
    super
  end

  private

  attr_reader :pagy

  def empty_pagy?
    pagy.prev.nil? && pagy.next.nil?
  end
end
