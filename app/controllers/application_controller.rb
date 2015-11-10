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
    redis = Redis.new
    
    count = Post.count
    @first = Post.published.order(published_at: :desc).limit(4)
    all = redis.zrevrange "leaderboard", 0, 3
    @leaderboard = []
    all.each do |a|
      item = redis.get "post:#{a}"
      @leaderboard.push(JSON.parse item) if item
      # binding.pry
    end
  end

end
