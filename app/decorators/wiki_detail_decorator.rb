class WikiDetailDecorator < ApplicationDecorator
  def logo_or_name
    h.link_to h.root_path do
      if logo.present?
        h.image_tag logo.url(:small)
      else
        h.content_tag :h1, name
      end
    end
  end
end
