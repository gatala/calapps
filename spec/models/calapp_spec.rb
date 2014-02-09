require 'spec_helper'

describe Calapp do 
	before do 
		@calapp = Calapp.new(name:"Example Calapp", URL:"http://www.example.com", creator: "Bob", user_email: "bob@bob.com", category: "Academic")
	end
		
	subject {@calapp}

	it { should respond_to(:name) }
  	it { should respond_to(:URL) }
  	it { should respond_to(:creator) }
  	it { should respond_to(:description) }

  	it { should be_valid }
	
	describe "when name is not present" do 
		before { @calapp.name = ""}
		it {should_not be_valid}
	end

	describe "when URL is not present" do
    	before { @calapp.URL = " " }
    	it { should_not be_valid }
  	end

  	describe "when name is too long" do
    	before { @calapp.name = "a" * 51 }
    	it { should_not be_valid }
  	end


  	describe "when URL address is already taken" do
    	before do
      		calapp_with_same_URL = @calapp.dup
      		calapp_with_same_URL.save
    	end

    	it { should_not be_valid }
  	end

  	describe "when URL address is already taken with different uppercases or lowercases" do
    	before do
      		calapp_with_same_URL = @calapp.dup
      		calapp_with_same_URL.URL = @calapp.URL.upcase
      		calapp_with_same_URL.save
    	end

   		it { should_not be_valid }
  	end

  	describe "when creator is not present" do
  		before do
    		@calapp = Calapp.new(name: "Example Calapp", URL: "example.com", creator: "")
 	    end
  		it { should_not be_valid }
    end
end