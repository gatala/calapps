class SessionsController < ApplicationController

	def new 
		render 'new'
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
