module Admin
class TextEffectsController < ApplicationController
  # GET /admin_text_effects
  # GET /admin_text_effects.xml
  def index
    @text_effects = TextEffect.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @text_effects }
    end
  end

  # GET /admin_text_effects/1
  # GET /admin_text_effects/1.xml
  def show
    @text_effect = TextEffect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @text_effect }
    end
  end

  # GET /admin_text_effects/new
  # GET /admin_text_effects/new.xml
  def new
    @text_effect = TextEffect.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @text_effect }
    end
  end

  # GET /admin_text_effects/1/edit
  def edit
    @text_effect = TextEffect.find(params[:id])
  end

  # POST /admin_text_effects
  # POST /admin_text_effects.xml
  def create
    @text_effect = TextEffect.new(params[:text_effect])

    respond_to do |format|
      if @text_effect.save
        flash[:notice] = 'Admin::TextEffect was successfully created.'
        format.html { redirect_to([:admin,@text_effect]) }
        format.xml  { render :xml => @text_effect, :status => :created, :location => @text_effect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text_effect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_text_effects/1
  # PUT /admin_text_effects/1.xml
  def update
    @text_effect = TextEffect.find(params[:id])

    respond_to do |format|
      if @text_effect.update_attributes(params[:text_effect])
        flash[:notice] = 'Admin::TextEffect was successfully updated.'
        format.html { redirect_to([:admin,@text_effect]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text_effect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_text_effects/1
  # DELETE /admin_text_effects/1.xml
  def destroy
    @text_effect = TextEffect.find(params[:id])
    @text_effect.destroy

    respond_to do |format|
      format.html { redirect_to(admin_text_effects_url) }
      format.xml  { head :ok }
    end
  end
end
end