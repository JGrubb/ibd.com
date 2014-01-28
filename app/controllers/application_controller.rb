class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :footer_stuff

  protected

  def require_user
    authenticate_user!
  end

  def footer_stuff
    posts = Post.published.sorted.reverse_order.to_ary
    @first = posts[0..3]
    @all = []
    4.times { @all << posts[rand(posts.count)] }
  end

end
