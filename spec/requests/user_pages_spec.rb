require 'spec_helper'
include Capybara::DSL

describe "User pages" do

	subject { page }

	describe "profile page", :pending=>true do
		let(:user) { FactoryGirl.create(:user) }
    	before { visit user_path(user) }

    	it { should have_content(user.name) }
    	it { should have_title(user.name) }
  	end

	describe "signup page", :pending=>true do
    	before { visit signup_path }

    	it { should have_content('Sign up') }
    	it { should have_title(full_title('Sign up')) }
  	end
end