class CalappsController < ApplicationController 

	def show 
		id = params[:id]
		@calapp = Calapp.find(id)
	end 


	def index 
		# This is for tags 
		if params[:tag] 
			@calapps = Calapp.tagged_with(params[:tag])
		else
			@calapps = Calapp.all
		end
	    
	    #This is for alphabetizing based on application name or creator
		@sort = params[:sort] || session[:sort]
		safe_list = ["name", "creator"]
		if safe_list.include? @sort
			session[:sort] = @sort
       			@calapps = Calapp.order(@sort.to_s)
		end
 
       	if (!params[:sort] && session[:sort]) 
			flash.keep
			redirect_to calapps_path({:sort => @sort})
        end
	end 

	def new 
		if not signed_in?
			redirect_to calapps_path
		end
	end 

	def create 
		@calapp = Calapp.create(params[:calapp])
		@calapp.user_email = current_user.email
		if @calapp.save
			flash[:notice] = "#{@calapp.name} was successfully created."
			redirect_to calapps_path
		else
			flash[:error] = 'error'
			render 'new'
		end
	end 


	def edit 
		@calapp = Calapp.find params[:id]
		if not signed_in? or (@calapp.user_email != current_user.email and current_user.is_admin == 'no')
			redirect_to calapps_path
		end		
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
