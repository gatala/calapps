class ReviewsController < ApplicationController

	def show 
		id = params[:id]
		@review = Review.find(id)
	end 

	def new 
		# if not signed_in?
		# 	#redirect_to calapp_path(current_app) #NEED SESSION HELPER 'CURRENT_APP'
		# 	flash[:error] = "Need to sign in to access reviews!"
		# 	redirect_to signin_path
		# end
<<<<<<< HEAD
		#@review = Review.new
=======
		@review = Review.new
>>>>>>> Comments work
	end 

	def create 
		@review = Review.create(params[:review])	
		#@calapp = @review.calapp
		@review.user_id = current_user.id
		@review.calapp_id = current_app
		#@review.app_id = calapp_id

		if @review.save
			flash[:notice] = "Review was successfully created."
			redirect_to calapp_path(current_app)
		else
			flash[:notice] = @review.errors.full_messages
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
