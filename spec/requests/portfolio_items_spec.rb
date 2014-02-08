require 'spec_helper'

describe "PortfolioItems" do
  describe "GET /portfolio" do
    it "gets the portfolio index" do
      get portfolio_items_path
      response.status.should be(200)
    end
  end

end
