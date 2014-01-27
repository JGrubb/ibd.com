class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where(published: true) }
  scope :sorted,    -> { order(:created_at) }
  scope :reverse_sorted, -> { sorted.reverse_order }

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
      month
    end
  end

  def year
    self.created_at.year
  end

end
