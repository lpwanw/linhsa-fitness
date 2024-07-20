class Pagy::Component < BaseComponent
  include Pagy::Frontend

  delegate :count, :from, :to, to: :pagy

  def initialize(pagy)
    @pagy = pagy
    super
  end

  private

  attr_reader :pagy
end
