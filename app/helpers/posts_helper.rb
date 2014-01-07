module PostsHelper
  require 'date'

  def post_date_path_helper post
    year = post.created_at.year
    month = post.created_at.month.to_s
    month = "0#{month}" if month.size == 1
    slug = post.slug
    post_date_path(year, month, slug)
  end

end
