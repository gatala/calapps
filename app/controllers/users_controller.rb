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
    if simple_captcha_valid? and @user.save
      UserMailer.registration_confirmation(@user).deliver
			flash[:success] = "You have succesfully registered."
			redirect_to welcome_success_path
		else 
			render 'new'
		end
	end

	def show 
    @user = User.find_by_id(params[:id])
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
		 @user = User.find_by_id(params[:id])
  	if @user.update_attributes(user_params)
    	flash[:success] = "Profile udpated!"
    	redirect_back_or @user
  	else
      flash[:error] = 'error'
      render 'edit'
  	end
	end

  def edit 
    @user = User.find_by_id(params[:id])
    if not signed_in? or (@user.email != current_user.email and !current_user.admin)
      redirect_to calapps_path
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
            :password_confirmation, :image, :school, :year, :public_name, :github, :major, :admin)
    end


    def signed_in_user
      redirect_to signin_urlnotice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find_by_id(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
