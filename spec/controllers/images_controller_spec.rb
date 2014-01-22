require 'spec_helper'

describe ImagesController do

  describe "GET 'delete'" do
    it "returns http success" do
      get 'delete'
      response.should be_success
    end
  end

end
