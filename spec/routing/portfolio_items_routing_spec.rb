require "spec_helper"

describe PortfolioItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/portfolio_items").should route_to("portfolio_items#index")
    end

    it "routes to #new" do
      get("/portfolio_items/new").should route_to("portfolio_items#new")
    end

    it "routes to #show" do
      get("/portfolio_items/1").should route_to("portfolio_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/portfolio_items/1/edit").should route_to("portfolio_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/portfolio_items").should route_to("portfolio_items#create")
    end

    it "routes to #update" do
      put("/portfolio_items/1").should route_to("portfolio_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/portfolio_items/1").should route_to("portfolio_items#destroy", :id => "1")
    end

  end
end
