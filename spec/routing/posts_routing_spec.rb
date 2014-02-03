require "spec_helper"

describe PostsController do
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("home#welcome")
    end

    it "routes to #new" do
      get("/posts/new").should route_to("posts#new")
    end

    it "routes to #show" do
      get("/2014/01/the-test").should route_to("posts#show", :id => "the-test", :year => "2014", :month => "01")
    end

    it "routes to #edit" do
      get("/posts/the-test/edit").should route_to("posts#edit", :id => "the-test")
    end

    it "routes to #create" do
      post("/posts").should route_to("posts#create")
    end

    it "routes to #update" do
      put("/posts/the-test").should route_to("posts#update", :id => "the-test")
    end

    it "routes to #destroy" do
      delete("/posts/the-test").should route_to("posts#destroy", :id => "the-test")
    end

  end
end
