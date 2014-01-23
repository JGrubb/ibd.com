class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true

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
    "#{self.created_at.year}"
  end

end
