require 'spec_helper'

describe Calapp do 
	before do
		@calapp = Calapp.new(name:"Example name",URL:"Example URL", creator:"Example creator", description:"Example description")
	end

	subject{@calapp}

	it {should respond_to(:name)}
	it {should respond_to(:URL)}
	it {should respond_to(:creator)}
	it {should respond_to(:description)}

	it { should be_valid }

	describe "when name is not present" do 
	    before { @calapp.name = ""}
	    it {should_not be_valid}
  	end

  	describe "when URL is not present" do 
	    before { @calapp.URL = ""}
	    it {should_not be_valid}
  	end

  	describe "when creator is not present" do 
	    before { @calapp.creator = ""}
	    it {should_not be_valid}
  	end

  	describe "when name is not present" do 
	    before { @calapp.description = ""}
	    it {should_not be_valid}
  	end

	
end