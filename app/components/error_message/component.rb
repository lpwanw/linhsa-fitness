# frozen_string_literal: true

class ErrorMessage::Component < BaseComponent
  def initialize(object, attribute)
    @object = object
    @attribute = attribute
    super()
  end

  private

  attr_reader :object, :attribute

  def message
    @message ||= object.errors.messages_for(attribute).to_sentence
  end

  def attribute_text
    object.class.human_attribute_name(attribute)
  end
end
