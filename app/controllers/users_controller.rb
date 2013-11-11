class UsersController < ApplicationController
	#before_action :signed_in_user, only: [:edit, :update]
	#before_action :correct_user, only: [:edit, :update]
	def new
    	if not signed_in?
        @user = User.new
      else
        redirect_to calapps_path
      end

  	end

	def create
  	@user = User.new(user_params)
    if @user.email == 'admin@admin.com'
      @user.is_admin= true
    else
      @user.is_admin= false
    end
		if @user.save
      UserMailer.registration_confirmation(@user).deliver
  		flash[:success] = "Welcome to Cal Apps!"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

	def show 
  	@user = User.find(params[:id])
    if not signed_in?
      redirect_to calapps_path
    end
  end 

	def index
  		if is_admin?
        @users = User.all #only admin should be able to see all users
      else
        redirect_to calapps_path
      end
  	end

  	def update
  		 @user = User.find(params[:id])
    	if @user.update_attributes(user_params)
      		flash[:success] = "Profile udpated!"
      		redirect_back_or @user
    	else
    		flash[:notice] = 'No Changes Made'
      	render 'edit'
    	end
  	end

  	def destroy 
  		User.find(params[:id]).destroy
    	flash[:success] = "User deleted."
    	redirect_to users_url
    end

    def edit 
      @user = User.find(params[:id])
      if not signed_in? or (@user.email != current_user.email and not current_user.is_admin)
        redirect_to calapps_path
      end
    	
    end

	private
		def user_params
    		params.require(:user).permit(:name, :email, :password,
            	:password_confirmation)
    	end


    def signed_in_user
      redirect_to signin_urlnotice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
