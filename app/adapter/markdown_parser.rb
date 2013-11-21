class MarkdownParser
  def initialize(markdown_content)
    @markdown_content = markdown_content
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  end

  def to_html
    @markdown.render(@markdown_content)
  end
end
