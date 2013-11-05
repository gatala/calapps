class CalappsController < ApplicationController 

	def show 
		id = params[:id]
		@calapp = Calapp.find(id)
	end 


	def index 
		@calapps = Calapp.all
	end 


	def new 
	end 

	# def create 
 #        @calapp = Calapp.create!(params[:calapp])
 #        flash[:notice] = "#{@calapp.name} was successfully created."
 #        redirect_to calapps_path
 #    end 

	def create 
		@calapp = Calapp.create!(params[:calapp])
		if @calapp.save
			flash[:notice] = "#{@calapp.name} was successfully created."
			redirect_to calapps_path
		else
			error = ""
			if @calapp.errors[:name] != []
				error += "- Name " 
				(0..5).each do |i|
					if @calapp.errors[:name][i] == nil
						break
					end
					error += (@calapp.errors[:name][i] + " and ")
				end
				error = error[0..-6] + "\n"
			end
			if @calapp.errors[:creator] != []
				error += "- Creator " 
				(0..5).each do |i|
					if @calapp.errors[:creator][i] == nil
						break
					end
					error += (@calapp.errors[:creator][i] + " and ")
				end
				error = error[0..-6] + "\n"
			end
			if @calapp.errors[:URL] != []
				error += "- URL " 
				(0..5).each do |i|
					if @calapp.errors[:URL][i] == nil
						break
					end
					error += (@calapp.errors[:URL][i] + " and ")
				end
				error = error[0..-6] + "\n"
			end
			flash[:notice] = error
			render 'new'
		end
	end 


	def edit 
		@calapp = Calapp.find params[:id]
	end 


	def update
		@calapp = Calapp.find params[:id]
		@calapp.update_attributes!(params[:calapp])
		flash[:notice] = "#{@calapp.name} was successfully updated."
		redirect_to calapp_path(@calapp)
	end 


	def destroy
		@calapp = Calapp.find(params[:id])
		@calapp.destroy
		flash[:notice] = "#{@calapp.name} was sucessfully deleted."
		redirect_to calapps_path
	end

end 