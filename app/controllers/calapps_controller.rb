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
	        @sort = params[:sort] || session[:sort] 
	        session[:sort] = @sort
	        @calapps = Calapp.find(:all, :order => @sort)
	        if (!params[:sort] && session[:sort]) 
			flash.keep
			redirect_to calapps_path({:sort => @sort})
	        end
	end 


	def new 
	end 

	def create 
		@calapp = Calapp.create(params[:calapp])
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
