module PostsHelper
  require 'date'

  def post_date_path_helper post
    post_date_path(post.year, post.month, post.slug)
  end

end
