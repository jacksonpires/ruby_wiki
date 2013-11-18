class Page < ActiveRecord::Base
  extend FriendlyId

  validates :title, :body, presence: true

  friendly_id :title, use: :slugged
end
