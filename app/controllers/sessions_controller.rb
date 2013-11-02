class SessionsController < ApplicationController

	def new 
		render 'new'
	end 

	def create 
		user = User.find(email: params[:session][:email].downcase).first
  		if user && user.authenticate(params[:session][:password])
    		sign_in user
      		redirect_to user
  		else
    		flash[:error] = "Invalid email or password."
    		render 'new'
    	end
	end 

	def destroy
    	sign_out
    	redirect_to root_url
  	end
end
