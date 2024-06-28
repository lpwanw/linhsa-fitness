# frozen_string_literal: true

class Dropdown < BaseComponent
  def initialize(name:)
    @name = name
    super()
  end

  private

  attr_reader :name
end
