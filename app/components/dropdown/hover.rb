# frozen_string_literal: true

class Dropdown::Hover < Dropdown
  def initialize(name:, href: nil)
    @href = href
    super(name:)
  end

  private

  attr_reader :href
end
