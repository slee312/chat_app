require 'spec_helper'

describe "Clowds" do
  describe "GET /clowds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get clowds_path
      response.status.should be(200)
    end
  end
end
