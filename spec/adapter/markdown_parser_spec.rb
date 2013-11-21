require 'spec_helper'

describe MarkdownParser do
  describe '#to_html' do
    it 'converts markdown to html' do
      markdown = "# Title\n\nContent **featured**"
      expected_html = "<h1>Title</h1>\n\n<p>Content <strong>featured</strong></p>\n"
      expect(described_class.new(markdown).to_html).to eql(expected_html)
    end
  end
end
