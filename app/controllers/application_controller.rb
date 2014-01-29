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
    @first = Post.all.last(4).reverse
    all = []
    4.times { all << rand(count) }
    @all = Post.find(all)
  end

end
