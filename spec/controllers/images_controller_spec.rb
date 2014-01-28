require 'spec_helper'

describe ImagesController do

  describe "DELETE 'delete'" do
    it "returns http success" do
      delete 'images/:id'
      response.should be_success
    end
  end

end
