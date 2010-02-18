class PartnerLinksController < ApplicationController
  # GET /partner_links
  # GET /partner_links.xml

  before_filter :go_home


  def index
    @partner_links = PartnerLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partner_links }
    end
  end

  # GET /partner_links/1
  # GET /partner_links/1.xml
  def show
    @partner_link = PartnerLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partner_link }
    end
  end

  # GET /partner_links/new
  # GET /partner_links/new.xml
  def new
    @partner_link = PartnerLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partner_link }
    end
  end

  # GET /partner_links/1/edit
  def edit
    @partner_link = PartnerLink.find(params[:id])
  end

  # POST /partner_links
  # POST /partner_links.xml
  def create
    @partner_link = PartnerLink.new(params[:partner_link])

    respond_to do |format|
      if @partner_link.save
        flash[:notice] = 'PartnerLink was successfully created.'
        format.html { redirect_to(@partner_link) }
        format.xml  { render :xml => @partner_link, :status => :created, :location => @partner_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partner_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partner_links/1
  # PUT /partner_links/1.xml
  def update
    @partner_link = PartnerLink.find(params[:id])

    respond_to do |format|
      if @partner_link.update_attributes(params[:partner_link])
        flash[:notice] = 'PartnerLink was successfully updated.'
        format.html { redirect_to(@partner_link) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partner_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partner_links/1
  # DELETE /partner_links/1.xml
  def destroy
    @partner_link = PartnerLink.find(params[:id])
    @partner_link.destroy

    respond_to do |format|
      format.html { redirect_to(partner_links_url) }
      format.xml  { head :ok }
    end
  end
end
