require 'kramdown'

module ApplicationHelper

  def markdown_filter(text)
     options = {
       coderay_line_numbers: nil
     }
    Kramdown::Document.new(text, options).to_html.html_safe
  end

  def title
    @title.blank? ? "Ignored by Dinosaurs" : "#{@title} | Ignored by Dinosaurs"
  end

  def summary
    @summary.blank? ? '' : @summary
  end

end
