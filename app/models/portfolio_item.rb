class PortfolioItem < ActiveRecord::Base
  mount_uploader :featured_image, PortfolioImageUploader
  extend FriendlyId

  has_many :images, as: :imageable, dependent: :delete_all
  accepts_nested_attributes_for :images, reject_if: lambda { |a| a[:image].blank? }

  friendly_id :title, use: :slugged
end
