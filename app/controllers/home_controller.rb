class HomeController < ApplicationController
  def welcome
    expires_in 5.minutes, public: true
  end
end
