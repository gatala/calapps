class UsersController < ApplicationController
	def new
  		@user = User.new
		if @user.save 
  			flash[:success] = "Welcome to Cal Apps!"
  			redirect_to @user
  		else 
  			render 'new'
  		end
  	end

	def show 
  		@user = User.find(params[:id])
  	end 

	def index 
  		@users = User.all
  	end

	private
	def user_params
    	params.require(:user).permit(:name, :email, :password,
            :password_confirmation)
    end
end
