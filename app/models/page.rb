class Page < ActiveRecord::Base
  extend FriendlyId

  belongs_to :updated_by, class_name: 'User'

  validates :title, :updated_by_id, presence: true

  friendly_id :title, use: :slugged

  has_paper_trail
end
