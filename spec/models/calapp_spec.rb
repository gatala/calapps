require 'spec_helper'

describe Calapp do 
	before do 
		@calapp = Calapp.new(name:"Example Calapp", url:"example.com", creator: "Bob")
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

  	describe "when URL format is invalid" do
    	it "should be invalid" do
      		addresses = %w[foo,com foo:foo@bar_baz.com foobaz+com]
      		addresses.each do |invalid_address|
        		@calapp.URL = invalid_address
       			expect(@calapp).not_to be_valid
      end
    end
  end

  	describe "when URL format is valid" do
  		it "should be valid" do
      		addresses = %w[foo.COM f.b.org foo.jp baz.cn]
      		addresses.each do |valid_address|
        		@calapp.URL = valid_address
        		expect(@calapp).to be_valid
      		end
    	end
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
    		@calapp = Calapp.new(name: "Example Calapp", url: "example.com", creator: "")
 	    end
  		it { should_not be_valid }
    end
end