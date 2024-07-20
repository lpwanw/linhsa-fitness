class Badge::Component < BaseComponent
  COLORS = %i[blue dark red green yellow indigo purple pink].freeze

  def initialize(text: "", color: :blue)
    @text = text
    @color = color.to_sym
    @color = COLORS.exclude?(@color) ? :blue : @color
    super()
  end

  private

  attr_reader :text, :color
end
