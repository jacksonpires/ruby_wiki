class WikiDetail < ActiveRecord::Base
  has_attached_file    :logo, styles: { small: '250>' }
  validates_attachment :logo, content_type: { content_type: /\Aimage\/.*\Z/ }

  belongs_to :initial_page, class_name: 'Page'
end
