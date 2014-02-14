module PostsHelper
  require 'date'

  def post_date_path_helper post
    post_date_path(post.year, post.month, post.slug)
  end

  def tags_link
    raw @post.tags.pluck(:name).map { |t| link_to t, tag_path(t) }.join(', ')
  end

end
