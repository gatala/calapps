class SessionsController < ApplicationController

	def new 
    if not signed_in?
      render 'new'
    else
      redirect_to calapps_path
    end
	end 

	def create 
		user = User.where(email: params[:session][:email].downcase).first
  		if user && user.authenticate(params[:session][:password])
    		sign_in user
      		redirect_to calapps_path
  		else
    		flash[:error] = "Invalid email or password."
    		render 'new'
    	end
	end 

	def destroy
    	sign_out
    	redirect_to root_url
      flash[:notice] = "You have successfully signed out"
  	end
end
