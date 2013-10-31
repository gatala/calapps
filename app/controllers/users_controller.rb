class UsersController < ApplicationController
	#before_action :signed_in_user, only: [:edit, :update]
	def new
    	@user = User.new
  	end

	def create
  		@user = User.new
		if @user.save 
  			flash[:success] = "Welcome to Cal Apps!"
  			redirect_to user_path
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

  	def update
  		 @user = User.find(params[:id])
    	if @user.update_attributes(user_params)
      		flash[:success] = "Profile udpated!"
      		redirect_to @user
    	else
      		render 'edit'
    	end
  	end

  	def destroy 
  		User.find(params[:id]).destroy
    	flash[:success] = "User deleted."
    	redirect_to users_url
    end

	private
	def user_params
    	params.require(:user).permit(:name, :email, :password,
            :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
