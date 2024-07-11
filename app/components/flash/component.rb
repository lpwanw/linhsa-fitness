# frozen_string_literal: true

class Flash::Component < BaseComponent
  def initialize(flash_type, message)
    @flash_type = flash_type.to_sym
    @message = message
    super()
  end

  private

  attr_reader :flash_type, :message

  def html_class
    case flash_type
    when :alert
      "text-red-500 bg-red-100 dark:bg-red-800 dark:text-red-200"
    else
      "text-green-500 bg-green-100 dark:bg-green-800 dark:text-green-200"
    end
  end
end
