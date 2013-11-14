require 'spec_helper'

describe CalappsController do
	describe 'Editing Calapps' do
		
		# it 'create calapp' do 
		# 	calapp = double('Calapp')
		# 	#user = double('User')

		# 	calapp.stub!(:name)
		# 	calapp.stub!(:URL)
		# 	calapp.stub!(:creator)
		# 	calapp.stub!(:description)
		# 	calapp.stub!(:user_email)
		# 	Calapp.should_receive(:create).and_return(calapp)
		# 	#Calapp.should_receive(:save).and_return(true)
		# 	put :create, {:calapp => calapp}
		# 	response.should redirect_to(calapps_path)
		# end

		it 'updating calapp' do
			mock = mock('Test Calapp')
			mock.stub!(:update_attributes!)
			mock.stub!(:name)
			mock.stub!(:creator)
			mock2 = mock('Test Calapp')
			Calapp.should_receive(:find).with('9').and_return(mock)
			post :update, {:id => '9', :calapp => mock2}
		end

		it 'Calapp should be loaded' do
			calapp = mock ("Calapp")
			Calapp.should_receive(:find).with('9').and_return(calapp)
			get :edit, {:id => '9'}
			response.should_not be_success
		end





		it 'delete calapp' do
	    	calapp = double('Calapp')
			calapp.stub(:name)
			calapp.stub(:creator)
			calapp.stub(:URL)
	      
	    	Calapp.should_receive(:find).with('9').and_return(calapp)
	    	calapp.should_receive(:destroy)
	    	post :destroy, {:id => '9'}
	    	response.should redirect_to(calapps_path)			
		end
	end
end