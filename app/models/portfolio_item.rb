class PortfolioItem < ActiveRecord::Base
  mount_uploader :featured_image, PortfolioImageUploader
end
