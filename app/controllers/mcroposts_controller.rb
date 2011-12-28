class McropostsController < ApplicationController
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
    @mcropost = Mcropost.new(params[:mcropost])

    respond_to do |format|
      if @mcropost.save
        format.html { redirect_to @mcropost, :notice => 'Mcropost was successfully created.' }
        format.json { render :json => @mcropost, :status => :created, :location => @mcropost }
      else
        format.html { render :action => "new" }
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
      format.html { redirect_to mcroposts_url }
      format.json { head :ok }
    end
  end
end
