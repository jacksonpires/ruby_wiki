class WikiDetail < ActiveRecord::Base
  has_attached_file :logo, styles: { small: 'x150' }

  belongs_to :initial_page, class_name: 'Page'
end
