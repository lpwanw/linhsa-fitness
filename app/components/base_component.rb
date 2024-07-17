# frozen_string_literal: true

class BaseComponent < ViewComponent::Base
  include Devise::Controllers::Helpers

  private

  def children
    content
  end

  def turbo_frame_tag(id, options = {}, &)
    tag.turbo_frame(id:, **options, &)
  end
end
