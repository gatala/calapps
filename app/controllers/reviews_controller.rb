class ReviewsController < ApplicationController

  def show 
    @review = Review.find_by_id(params[:id])
  end 

  def new 
    if not signed_in?
      redirect_to calapp_path(current_app), notice: "Need to sign in to access reviews!"
    elsif not (is_admin? or berkeley_user?)
      redirect_to calapp_path(current_app), notice: "Only UC Berkeley users can write reviews!"
    elsif Review.where(user_id: current_user.id, calapp_id: current_app).first
      redirect_to calapp_path(current_app), notice: "Already created a review for this app!"
    else
      @review = Review.new
    end
  end 

  def create 
    @review = Review.create(params[:review])        
    @review.user_id = current_user.id
    @review.calapp_id = current_app

    if @review.save
      Calapp.add_change("#{current_user.email} wrote a review for #{Calapp.find_by_id(current_app).name}")
      redirect_to calapp_path(current_app), notice: "Review was successfully created."
    else
      flash[:notice] = @review.errors.full_messages
      render 'new'
    end
  end

  def edit 
    @review = Review.where(user_id: current_user.id, calapp_id: current_app).first
    if not signed_in? or (@review.user_id != current_user.id and !is_admin?)
      redirect_to calapp_path(@calapp)
    end   
  end

  def update
    @review = Review.where(user_id: current_user.id, calapp_id: current_app).first
    @review.update_attributes!(params[:review])
    Calapp.add_change("#{current_user.email} updated a review for #{Calapp.find_by_id(current_app).name}")
    redirect_to calapp_path(current_app), notice: "Review was successfully updated."
  end 

  def destroy
    if is_admin?
      user_id = params[:user_id]
    else
      user_id = current_user.id
    end
    if Review.where(user_id: user_id, calapp_id: current_app).first
      @review = Review.where(user_id: user_id, calapp_id: current_app).first
      @review.destroy
      Calapp.add_change("#{current_user.email} deleted a review for #{Calapp.find_by_id(current_app).name}")
      redirect_to calapp_path(current_app), notice: "Review was sucessfully deleted."
    else
      redirect_to calapp_path(current_app), notice: "No review to destroy!"
    end 
  end
end
