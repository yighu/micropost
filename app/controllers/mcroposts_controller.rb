class McropostsController < ApplicationController
	before_filter :authenticate, :only => [:create, :destroy]
	before_filter :authorized_user, :only => :destroy
  # GET /mcroposts
  # GET /mcroposts.json
  def index
    @mcroposts = Mcropost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @mcroposts }
    end
  end

  # GET /mcroposts/1
  # GET /mcroposts/1.json
  def show
    @mcropost = Mcropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @mcropost }
    end
  end

  # GET /mcroposts/new
  # GET /mcroposts/new.json
  def new
    @mcropost = Mcropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @mcropost }
    end
  end

  # GET /mcroposts/1/edit
  def edit
    @mcropost = Mcropost.find(params[:id])
  end

  # POST /mcroposts
  # POST /mcroposts.json
  def create
    @mcropost = current_user.mcroposts.build(params[:mcropost])

    respond_to do |format|
      if @mcropost.save
	      flash[:success]="microposts created"
        #format.html { redirect_to @mcropost, :notice => 'Mcropost was successfully created.' }
        format.html { redirect_to root_path }
        format.json { render :json => @mcropost, :status => :created, :location => @mcropost }
      else
	      @feed_items=[]
        format.html { render 'pages/home' }
        format.json { render :json => @mcropost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mcroposts/1
  # PUT /mcroposts/1.json
  def update
    @mcropost = Mcropost.find(params[:id])

    respond_to do |format|
      if @mcropost.update_attributes(params[:mcropost])
        format.html { redirect_to @mcropost, :notice => 'Mcropost was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @mcropost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mcroposts/1
  # DELETE /mcroposts/1.json
  def destroy
    @mcropost = Mcropost.find(params[:id])
    @mcropost.destroy

    respond_to do |format|
      #format.html { redirect_to mcroposts_url }
      format.html { redirect_back_or root_path}
      format.json { head :ok }
    end
  end

private
     
def authorized_user
   @mcropost = current_user.mcroposts.find_by_id(params[:id])
     redirect_to root_path if @mcropost.nil?
end
end
