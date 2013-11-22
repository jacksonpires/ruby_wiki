require 'spec_helper'

describe PagesHelper do
  describe '#html_body' do
    context 'when content is present' do
      it 'returns a html content' do
        markdown = "* First\n* Second"
        expect(html_body(markdown)).to eql("<ul>\n<li>First</li>\n<li>Second</li>\n</ul>\n")
      end
    end

    context 'when content is empty' do
      it 'returns an empty message' do
        expect(html_body('')).to eql('(empty)')
      end
    end
  end
end
