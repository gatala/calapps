class CalappsController < ApplicationController 

	def show 
		id = params[:id]
		@calapp = Calapp.find(id)
	end 


	def index 
		if params[:tag] 
			@calapps = Calapp.tagged_with(params[:tag])
		else
			@calapps = Calapp.all
		end
	end 


	def new 
	end 

	def create 
		@calapp = Calapp.create(params[:calapp])
		@calapp.user_email = current_user.email
		if @calapp.save
			flash[:notice] = "#{@calapp.name} was successfully created."
			redirect_to calapps_path
		else
			render 'new'
		end
	end 


	def edit 
		@calapp = Calapp.find params[:id]
	end 


	def update
		@calapp = Calapp.find params[:id]
		@calapp.update_attributes!(params[:calapp])
		flash[:notice] = "#{@calapp.name} was successfully updated."
		redirect_to calapp_path(@calapp)
	end 


	def destroy
		@calapp = Calapp.find(params[:id])
		@calapp.destroy
		flash[:notice] = "#{@calapp.name} was sucessfully deleted."
		redirect_to calapps_path
	end
end 