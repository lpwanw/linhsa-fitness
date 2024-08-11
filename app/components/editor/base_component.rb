# frozen_string_literal: true

class Editor::BaseComponent < BaseComponent
  def initialize(block)
    @block = block
  end

  private

  attr_reader :block

  def content
    @content ||= block.dig(:data, :text)
  end

  def html_content
    doc = Nokogiri::HTML::DocumentFragment.parse(content)

    doc.css("a").each do |link|
      href = link["href"]

      next if href.blank?

      if href.start_with?("http://", "https://")
        link["target"] = "_blank"
        link["rel"] = "noopener noreferrer"
      else
        link["target"] = "_top"
      end
    end

    sanitize doc.to_html, attributes: %w[href target rel]
  end
end
