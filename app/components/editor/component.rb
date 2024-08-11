# frozen_string_literal: true

class Editor::Component < BaseComponent
  def initialize(data)
    @data = JSON.parse(data).with_indifferent_access
  end

  private

  attr_reader :data

  def component_blocks
    @component_blocks ||= blocks.map do |block|
      Editor::Paragraph::Component.new block
    end
  end

  def blocks
    @blocks ||= @data[:blocks]
  end
end
