# frozen_string_literal: true

class Badge::ImportFile::Status < Badge::Component
  STATUS_COLORS = {
    created: :yellow,
    processing: :blue,
    completed: :green,
    error: :red,
  }.freeze

  def initialize(status:)
    @status = status
    super(color: STATUS_COLORS[@status.to_sym])
  end

  def before_render
    @text = t("import_file.status.#{@status}")
  end
end
