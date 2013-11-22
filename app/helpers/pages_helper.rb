module PagesHelper
  def html_body(content)
    if content.present?
      MarkdownParser.new(content).to_html.html_safe
    else
      '(empty)'
    end
  end
end
