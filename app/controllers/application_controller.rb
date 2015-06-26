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
    count = Post.count
    @first = Post.published.order(published_at: :desc).limit(4)
    all = []
    4.times { all << (rand(count) + 1) } if count > 4
    @all = Post.find(all)
  end

end
