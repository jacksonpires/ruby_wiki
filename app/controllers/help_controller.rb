class HelpController < ApplicationController
  def markdown_reference
    @markdown_reference_list = MarkdownReference.all
  end
end
