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
    @user = User.new(params[:user])
    if simple_captcha_valid? and @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to welcome_success_path, notice: "You have succesfully registered."
    else
      flash[:error] = @user.errors.full_messages
      flash[:captcha] = simple_captcha_valid? ? 0 : 1
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
    if not signed_in? or (@user.email != current_user.email and !is_admin?)
      redirect_to calapps_path
    else
      if is_admin?
        @user.admin = params[:user][:admin]
        params[:user].delete(:admin)
        @user.save
      end
      if @user.update_attributes(params[:user])
        redirect_to :back, notice: "Profile updated!"
      else
        flash[:error] = @user.errors.full_messages
        render 'edit'
      end
    end
  end

  def edit 
    @user = User.find_by_id(params[:id])
    if not signed_in? or (@user.email != current_user.email and !is_admin?)
      redirect_to calapps_path
    end
  end

  def destroy
    if !is_admin?
      redirect_to :back
    else
      @user = User.find_by_id(params[:id])
      @user.destroy
    end
  end

  private

    def signed_in_user
      redirect_to signin_urlnotice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find_by_id(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
