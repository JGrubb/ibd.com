class StatsController < ApplicationController
  
  def incr
    redis = Redis.new
    redis.incr(params[:id])
    render nothing: true
    # binding.pry
  end
  
end
