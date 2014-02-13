class CalappsController < ApplicationController 

  def show 
    @calapp = Calapp.find_by_id(params[:id])
  end 

  #This is solely for the use of the gallery page
  def gallery 
    @calapps = Calapp.order(:name) 

    session[:search_query] = params[:search_query]

    if ! [nil, ""].include?(session[:search_query])
      query = "%"+session[:search_query].upcase+"%"
      @calapps = @calapps.where("upper(name) like ? or upper(description) like ? or upper(creator) like ?", query, query, query)
    end
  end

    #This is solely for the use of the alphabetized version of the gallery page. 
  def alphabetize
    @calapps = Calapp.all.group_by{|c| c.name[0]}
  end

  #This is used for category view
  def category
    @category = params[:category]
    @calapps = Calapp.where(category: @category)
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
    @calapp = Calapp.find_by_id(params[:id])
    if not signed_in? or (@calapp.user_email != current_user.email and !current_user.admin)
      redirect_to calapps_path
    end     
  end 

  def update
    @calapp = Calapp.find_by_id(params[:id])
    if @calapp.update_attributes(params[:calapp])
      redirect_back_or @calapp, notice: "#{@calapp.name} was successfully updated."
    else
      flash[:error] = 'error'
      render 'edit'
    end
  end

  def destroy
    @calapp = Calapp.find_by_id(params[:id])
    @calapp.destroy
    redirect_to calapps_path, notice: "#{@calapp.name} was sucessfully deleted."
  end
end 