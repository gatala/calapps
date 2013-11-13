require 'spec_helper'

describe "Welcomes" do
  describe "GET /welcomes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root
      response.status.should be(200)
    end
  end
end
