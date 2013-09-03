require "spec_helper"

describe ClowdsController do
  describe "routing" do

    it "routes to #index" do
      get("/clowds").should route_to("clowds#index")
    end

    it "routes to #new" do
      get("/clowds/new").should route_to("clowds#new")
    end

    it "routes to #show" do
      get("/clowds/1").should route_to("clowds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clowds/1/edit").should route_to("clowds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clowds").should route_to("clowds#create")
    end

    it "routes to #update" do
      put("/clowds/1").should route_to("clowds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clowds/1").should route_to("clowds#destroy", :id => "1")
    end

  end
end
