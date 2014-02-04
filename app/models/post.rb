class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :images, as: :imageable, dependent: :delete_all
  accepts_nested_attributes_for :images, reject_if: lambda { |a| a[:image].blank? }

  scope :published, -> { where(published: true) }
  scope :sorted,    -> { order(:created_at) }

  validates :title, presence: true

  def self.pub_and_sorted
    all.to_ary.select { |a| a.published? }.sort { |a, b| a.created_at <=> b.created_at }
  end

  def self.searchable_language
    'english'
  end

  def month
    month = self.created_at.month
    if "#{month}".size == 1
      "0#{month}"
    else
      month.to_s
    end
  end

  def year
    self.created_at.year.to_s
  end

end
