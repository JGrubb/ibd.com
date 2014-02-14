class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :images, as: :imageable, dependent: :delete_all
  accepts_nested_attributes_for :images, reject_if: lambda { |a| a[:image].blank? }
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :tags, reject_if: lambda { |t| t[:name].blank? }

  scope :published, -> { where(published: true) }
  scope :sorted,    -> { order(:created_at) }

  validates :title, presence: true

  def self.searchable_language
    'english'
  end

  def self.tagged_with(name)
    Tag.find_by(name: name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.downcase.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
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
