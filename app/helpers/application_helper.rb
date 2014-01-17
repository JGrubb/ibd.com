require 'kramdown'

module ApplicationHelper

  def markdown_filter(text)
    Kramdown::Document.new(text).to_html.html_safe
  end

  def title
    @title.blank? ? "Ignored by Dinosaurs" : "#{@title} | Ignored by Dinosaurs"
  end

  def summary
    @summary.blank? ? '' : @summary
  end

end
