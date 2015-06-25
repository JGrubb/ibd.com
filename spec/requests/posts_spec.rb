require 'spec_helper'

describe "Posts" do
  describe "GET /archive" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post = create :post
      get post_index_path
      response.status.should be(200)
    end
  end
end
