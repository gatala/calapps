require 'spec_helper'

describe CalappsController do
	describe 'Editing Calapps' do

		# it 'create movie' do
		# 	calapp = double('Calapp')
		# 	calapp.stub(:name)
		# 	calapp.stub(:creator)
		# 	calapp.stub(:URL)

		# 	Calapp.should_receive(:create!).and_return(calapp)
		# 	post :create, {:calapp => calapp}
		# 	response.should redirect_to(calapps_path)		
		# end

		it 'delete movie' do
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