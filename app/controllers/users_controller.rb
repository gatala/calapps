class UsersController < ApplicationController
  def new
  	@user = User.new
  	if @user.save 
  	else 
  		render 'new'
  	end
  end

  def show 
  	@user = User.find(params[:id])
  end 

end
