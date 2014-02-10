class ReviewsController < ApplicationController

	def show 
		id = params[:id]
		@review = Review.find(id)
	end 

	def new 
		if not signed_in?
			flash[:notice] = "Need to sign in to access reviews!"
			redirect_to calapp_path(current_app)
		elsif Review.where(user_id: current_user.id, calapp_id: current_app).first
			flash[:notice] = "Already created a review for this app!"
			redirect_to calapp_path(current_app)
		else
 			@review = Review.new
 		end
	end 

	def create 
        @review = Review.create(params[:review])        
        @review.user_id = current_user.id
        @review.calapp_id = current_app

		if @review.save
			flash[:notice] = "Review was successfully created."
			redirect_to calapp_path(current_app)
		else
			flash[:notice] = @review.errors.full_messages
			render 'new'
		end
	end

	def edit 
		@review = Review.where(user_id: current_user.id, calapp_id: current_app).first
		if not signed_in? or (@review.user_id != current_user.id and !current_user.admin)
			redirect_to calapp_path(@calapp)
		end		
	end

	def update
		@review = Review.where(user_id: current_user.id, calapp_id: current_app).first
		@review.update_attributes!(params[:review])
		flash[:notice] = "Review was successfully updated."
		redirect_to calapp_path(current_app)
	end 

	def destroy
		if Review.where(user_id: current_user.id, calapp_id: current_app).first
			@review = Review.where(user_id: current_user.id, calapp_id: current_app).first
			@review.destroy
			flash[:notice] = "Review was sucessfully deleted."
			redirect_to calapp_path(current_app)
		else
			flash[:notice] = "No review to destroy!"
			redirect_to calapp_path(current_app)	
		end		
	end

end
