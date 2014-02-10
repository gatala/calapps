class CalappsController < ApplicationController 

    def show 
        id = params[:id]
        @calapp = Calapp.find_by_id(id)
    end 

    #This is solely for the use of the gallery page
    def gallery 
        @calapps = Calapp.all 
    end

    #This is solely for the use of the alphabetized version of the gallery page. 
    def alphabetize
        @calapps = Calapp.all.group_by{|c| c.name[0]}
    end

    #This is used for category view
    def category
        category = params[:category]
        @category = category
        @calapps = Calapp.where(category: category)
    end

    #This is for admin view only. 
    def index 
        # This is for tags 
        if params[:tag] 
            @calapps = Calapp.tagged_with(params[:tag])
        else
            @calapps = Calapp.all
        end
        
        #This is for alphabetizing based on application name or creator
        # we should consider having the original list updated by "last updated or last posted"
        #still needs to be fixed/ session collides with the ability to use the search engine
        @sort = params[:sort] || session[:sort]
        safe_list = ["name", "creator", "updated_at"]
        if safe_list.include? @sort
            session[:sort] = @sort
                @calapps = Calapp.order(@sort.to_s)
        end
 
        if (!params[:sort] && session[:sort]) 
            flash.keep
            redirect_to calapps_path({:sort => @sort})
        end
    end 

    def new 
        if not signed_in?
            redirect_to calapps_path
        else
            @calapp = Calapp.new
        end

    end 

    def create 
        @calapp = Calapp.new(params[:calapp])
        @calapp.user_email = current_user.email
        if @calapp.save
            redirect_to '/gallery', notice: "#{@calapp.name} was successfully created."
        else
            flash[:error] = 'error'
            render action: 'new'
        end
    end 


    def edit 
        @calapp = Calapp.find_by_idparams[:id]
        if not signed_in? or (@calapp.user_email != current_user.email and !current_user.admin)
            redirect_to calapps_path
        end     
    end 


    def update
        @calapp = Calapp.find_by_id(params[:id])
        #@calapp.update_attributes!(params[:calapp])
        #flash[:notice] = "#{@calapp.name} was successfully updated."
        #redirect_to calapp_path(@calapp)
        if @calapp.update_attributes(params[:calapp])
            flash[:notice] = "#{@calapp.name} was successfully updated."
            redirect_back_or @calapp
        else
          flash[:error] = 'error'
          render 'edit'
        end
    end


    def destroy
        @calapp = Calapp.find(params[:id])
        @calapp.destroy
        flash[:notice] = "#{@calapp.name} was sucessfully deleted."
        redirect_to calapps_path
    end
end 
