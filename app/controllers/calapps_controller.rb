class CalappsController < ApplicationController 
  respond_to :json

  def search
    @calapps = Calapp.approved
    @calapps = @calapps.name_search("%"+params[:name].upcase+"%") if params[:name]
    @calapps = @calapps.creator_search("%"+params[:creator].upcase+"%") if params[:creator]
    @calapps = @calapps.description_search("%"+params[:description].upcase+"%") if params[:description]
    @calapps = @calapps.category_search("%"+params[:category].upcase+"%") if params[:category]
    render :partial => "calapps/search.json"
  end

  def show 
    @calapp = Calapp.find_by_id(params[:id])
  end 

  #This is solely for the use of the gallery page
  def index
    @pending = params[:pending]
    @archived = params[:archived]

    if @pending
      @calapps = Calapp.pending.active.order(:name)
    elsif @archived
      @calapps = Calapp.archived.order(:name)
    else
      @calapps = Calapp.approved.active.order(:name)
    end
    
    session[:search_query] = params[:search_query]

    if ! [nil, ""].include?(session[:search_query])
      query = "%"+session[:search_query].upcase+"%"
      @calapps = @calapps.where("upper(name) like ? or upper(description) like ? or upper(creator) like ? or upper(category) like ?", query, query, query, query)
    end
    
    @calapps_aca = Calapp.where(category:"Academic")[0,4]
    @calapps_com = Calapp.where(category:"Commerce")[0,4]
  end

  #This is used for category view
  def category
    category = params[:category]
    @category = category
    @calapps = Calapp.approved.active.where(category: category)
  end

=begin
  #This is for admin view only. 
  def index
    @calapps = params[:pending] ? Calapp.pending : Calapp.approved
    @pending = params[:pending]

    # This is for tags 
    if params[:tag]
      @calapps = @calapps.tagged_with(params[:tag])
    end
        
    #This is for alphabetizing based on application name or creator
    # we should consider having the original list updated by "last updated or last posted"
    #still needs to be fixed/ session collides with the ability to use the search engine
    @sort = params[:sort] || session[:sort]
    safe_list = ["name", "creator", "updated_at"]
    if safe_list.include? @sort
      session[:sort] = @sort
      @calapps = @calapps.order(@sort.to_s)
    end
 
    if (!params[:sort] && session[:sort]) 
      flash.keep
      redirect_to calapps_path({:sort => @sort, :pending => @pending})
    end
  end
=end

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
    if berkeley_user? or is_admin?
      @calapp.approved = true
    end
    if @calapp.save
      redirect_to '/calapps', notice: (berkeley_user? or is_admin?) ? "#{@calapp.name} was successfully created." : "#{@calapp.name} submitted for approval."
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
    @calapp.campus_approved = params[:calapp][:campus_approved]
    @calapp.approved = params[:calapp][:approved]
    params[:calapp].delete(:campus_approved)
    params[:calapp].delete(:approved)
    if @calapp.save and @calapp.update_attributes(params[:calapp])
      flash[:notice] = "#{@calapp.name} was successfully updated."
      redirect_back_or @calapp
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
