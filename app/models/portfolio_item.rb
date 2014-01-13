class PortfolioItem < ActiveRecord::Base
  mount_uploader :featured_image, PortfolioImageUploader
  extend FriendlyId

  friendly_id :title, use: :slugged
end
