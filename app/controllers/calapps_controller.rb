class CalappsController < ApplicationController 

	def show 
		id = params[:id]
		@calapp = Calapp.find(id)
	end 


	def index 
		@calapps = Calapp.all
	end 


	def new 
	end 

	def create 
		@calapp = Calapp.create!(params[:calapp])
		flash[:notice] = "#{@calapp.name} was successfully created."
		redirect_to calapps_path
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
		@calapp = Calapp.find(param[:id])
		@calapp.destroy
		flash[:notice] = "#{calapp.name} was sucessfully deleted."
		redirect_to calapps_path
	end




end 