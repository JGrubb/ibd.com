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
    @all = Post.order('created_at DESC').limit(4)
  end

end
