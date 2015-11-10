class StatsController < ApplicationController
  
  def view
    redis = Redis.new
    redis.incr(params[:id])
    redis.zincrby "leaderboard", 1, params[:id]
    
    post = { title: params[:title], url: params[:url] }
    redis.set("post:#{params[:id]}", post.to_json)
    
    render nothing: true
    # binding.pry
  end
  
end
