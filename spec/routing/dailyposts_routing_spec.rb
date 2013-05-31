require "spec_helper"

describe DailypostsController do
  describe "routing" do

    it "routes to #index" do
      get("/dailyposts").should route_to("dailyposts#index")
    end

    it "routes to #new" do
      get("/dailyposts/new").should route_to("dailyposts#new")
    end

    it "routes to #show" do
      get("/dailyposts/1").should route_to("dailyposts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dailyposts/1/edit").should route_to("dailyposts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dailyposts").should route_to("dailyposts#create")
    end

    it "routes to #update" do
      put("/dailyposts/1").should route_to("dailyposts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dailyposts/1").should route_to("dailyposts#destroy", :id => "1")
    end

  end
end
