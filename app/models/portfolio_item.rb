class PortfolioItem < ActiveRecord::Base
  mount_uploader :featured_image, PortfolioImageUploader
  extend FriendlyId

  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images

  friendly_id :title, use: :slugged
end
