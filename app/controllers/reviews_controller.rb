class ReviewsController < ApplicationController

	def show 
		id = params[:id]
		@review = Review.find(id)
	end 

	def new 
		if not signed_in?
			#redirect_to calapp_path(current_app) #NEED SESSION HELPER 'CURRENT_APP'
			redirect_to signin_path
		else 
			redirect_to new_review_path
		end
	end 

	def create 
		@review = Review.create(params[:review])
		@review.review_user = current_user.email
		@review.app_id = current_app.id
		if @review.save
			flash[:notice] = "Review was successfully created."
			redirect_to calapp_path(current_app)
		else
			flash[:error] = 'error'
			render 'new'
		end
	end

	def edit 
		@review = Review.find params[:id]
		if not signed_in? or (@review.review_user != current_user.email and current_user.is_admin == 'no')
			redirect_to calapp_path(@calapp)
		end		
	end

	def update
		@review = Review.find params[:id]
		@review.update_attributes!(params[:review])
		flash[:notice] = "Review was successfully updated."
		redirect_to calapp_path(current_app)
	end 

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		flash[:notice] = "Review was sucessfully deleted."
		redirect_to calapp_path(current_app)
	end

end
