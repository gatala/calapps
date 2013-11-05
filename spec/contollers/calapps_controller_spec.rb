require 'spec_helper'

describe CalappsController do
	describe 'Editing Calapps' do

		it 'create movie' do
			calapp = mock('Calapp')
			calapp.stub!(:name)
			calapp.stub!(:creator)
			calapp.stub!(:URL)

			Calapp.should_receive(:create!).and_return(calapp)
			put :create, {:calapp => calapp}
			response.should redirect_to(calapps_path)		
		end
	end
end