class BuysController < ApplicationController
		before_filter :authorizeadm, :only => [:index, :show]
		before_filter :authorizeusr, :only => [:edit, :destroy, :new, :create, :update]
	layout "main"
  # GET /buys
  # GET /buys.xml
  def index
    @buys = Buy.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buys }
    end
  end

  # GET /buys/1
  # GET /buys/1.xml
  def show
    @buy = Buy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @buy }
    end
  end

  # GET /buys/new
  # GET /buys/new.xml
  def new

    @buy = Buy.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @buy }
    end
  end

  # GET /buys/1/edit
  def edit
    @buy = Buy.find(params[:id])
  end

  # POST /buys
  # POST /buys.xml
  def create
    @buy = Buy.new(params[:buy])

    respond_to do |format|
      if @buy.save
        flash[:notice] = 'Buy was successfully created.'
        format.html { redirect_to(@buy) }
        format.xml  { render :xml => @buy, :status => :created, :location => @buy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @buy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buys/1
  # PUT /buys/1.xml
  def update
    @buy = Buy.find(params[:id])

    respond_to do |format|
      if @buy.update_attributes(params[:buy])
        flash[:notice] = 'Buy was successfully updated.'
        format.html { redirect_to(@buy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @buy.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /buys/1
  # DELETE /buys/1.xml
  def destroy
    @buy = Buy.find(params[:id])
    @buy.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
