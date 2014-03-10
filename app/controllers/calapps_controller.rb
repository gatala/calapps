class CalappsController < ApplicationController 
  respond_to :json

  def search
    @calapps = Calapp.approved
    @calapps = @calapps.name_search("%"+params[:name].upcase+"%") if params[:name]
    @calapps = @calapps.creator_search("%"+params[:creator].upcase+"%") if params[:creator]
    @calapps = @calapps.description_search("%"+params[:description].upcase+"%") if params[:description]
    @calapps = @calapps.category_search("%"+params[:category].upcase+"%") if params[:category]
    @calapps = @calapps.tagged_with(params[:tag]) if params[:tag]
    render :partial => "calapps/search.json"
  end

  def show 
    @calapp = Calapp.find_by_id(params[:id])
  end 

  #This is solely for the use of the gallery page
  def index
    @pending = session[:pending] = params[:pending]
    @archived = session[:archived] = params[:archived]

    if @pending
      @calapps = Calapp.pending.active.order(:name)
    elsif @archived
      @calapps = Calapp.archived.order(:name)
    else
      @calapps = Calapp.approved.active.order(:name)
    end

    @query = session[:search_query] = params[:search_query]

    if ! [nil, ""].include?(@query)
      query = "%"+@query.upcase+"%"
      @calapps = @calapps.search_query(query)
    end

    @category = session[:category] = params[:category]
    
    if @category
      @calapps = @calapps.category_search("%"+params[:category].upcase+"%")
    end

    @tag = session[:tag] = params[:tag]

    if @tag
      @calapps = @calapps.tagged_with(params[:tag])
    end
 
    if @pending or @archived or @tag or @category or @query
      @home = false
    else
      @home = true
      @calapp = Calapp
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
    if is_admin?
      @calapp.approved = true
    end
    if @calapp.save
      Calapp.add_change("#{current_user.email} created #{@calapp.name}")
      redirect_to '/calapps', notice: is_admin? ? "#{@calapp.name} was successfully created." : "#{@calapp.name} submitted for approval."
    else
      flash[:error] = @calapp.errors.full_messages
      render action: 'new'
    end
  end 

  def edit 
    @calapp = Calapp.find_by_id(params[:id])
    if not signed_in? or (@calapp.user_email != current_user.email and !is_admin?)
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
      Calapp.add_change("#{current_user.email} updated #{@calapp.name}")
      flash[:notice] = "#{@calapp.name} was successfully updated."
      redirect_back_or @calapp
    else
      flash[:error] = @calapp.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @calapp = Calapp.find_by_id(params[:id])
    @calapp.destroy
    Calapp.add_change("#{current_user.email} deleted #{@calapp.name}")
    redirect_to calapps_path, notice: "#{@calapp.name} was sucessfully deleted."
  end

  def archive
    if is_admin?
      calapp = Calapp.find_by_id(params[:id])
      if calapp.archived
        calapp.archived = false
        flash[:notice] = "#{calapp.name} was successfully unarchived."
      else
        calapp.archived = true
        flash[:notice] = "#{calapp.name} was successfully archived."
      end
      calapp.save
    end
    redirect_to :back
  end

  def approve
    if is_admin?
      calapp = Calapp.find_by_id(params[:id])
      calapp.approved = true
      calapp.save
      flash[:notice] = "#{calapp.name} was successfully approved."
    end
    redirect_to :back
  end 

  def feed
    if is_admin?
      @changes = Calapp.changes
    else
      redirect_to :back
    end
  end

end 
