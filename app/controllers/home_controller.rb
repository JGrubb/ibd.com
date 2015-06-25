class HomeController < ApplicationController
  def welcome
    expires_in 7.days, public: true
  end
end
