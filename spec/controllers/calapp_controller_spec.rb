require 'spec_helper'

describe CalappsController do 
	describe 'Editing CalApps' do
		
		it 'create calapp' do
			calapp = mock('calapp')
			calapp.stub!(:name)

			Calapp.should_receive(:create!).and_return(calapp)
			put :create, {:calapp => calapp}
			response.should redirect_to(calapps_path)
		end

		it 'update calapp' do
			calapp = mock('calapp')
			#calapp.stub!(:name=)
			Calapp.should_receive(:edit_calapp)#.and_return(calapp)
			get :edit_calapp
			#response.should redire
		end


	end
	
end