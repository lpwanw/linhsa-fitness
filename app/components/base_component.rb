# frozen_string_literal: true

class BaseComponent < ViewComponent::Base
  include Devise::Controllers::Helpers

  private

  def children
    content
  end
end
