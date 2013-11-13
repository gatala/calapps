class UsersController < ApplicationController
	#before_action :signed_in_user, only: [:edit, :update]
	#before_action :correct_user, only: [:edit, :update]
	def new
  	@user = User.new
	end

	def create
		@user = User.new(user_params)
	if @user.save 
      UserMailer.registration_confirmation(@user).deliver
			flash[:success] = "You have succesfully registered."
			redirect_to welcome_success_path
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
    		redirect_back_or @user
  	else
  		flash.new[:error] = 'Invalid email/password'
    		render 'edit'
  	end
	end

  def edit 
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
            :password_confirmation, :image)
    end


    def signed_in_user
      redirect_to signin_urlnotice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
