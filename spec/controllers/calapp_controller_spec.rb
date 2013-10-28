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

		it 'deleting calapp' do
			calapp = mock('Calapp')
			calapp.stub!(:name)

			Calapp.should_receive(:find).and_return(calapp)
			calapp.should_receive(:destroy)
			post :destroy, {:id => '9'}
		end

		it 'updating calapp' do
			mock = mock('Calapp')
			mock.stub!(:update_attributes!)
			mock.stub!(:name)
			mock.stub!(:creator)

			mock2 = mock("Calapp")
			Calapp.should_receive(:find).and_return(mock)
			post :update, {:id => '9', :calapp=>mock2}
		end

		it "Calapp should be loaded" do
			calapp = mock("Calapp")
			Calapp.should_receive(:find).with('9').and_return(calapp)
			get :edit, {:id => '9'}
			response.should be_success
		end

		it "Show calapp ID" do
			calapp = mock("Calapp")
			Calapp.should_receive(:find).with('9').and_return(calapp)
			get :show, {:id => '9'}
		end
	end
	
end