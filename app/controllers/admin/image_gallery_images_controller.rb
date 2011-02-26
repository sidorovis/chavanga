module Admin
 class ImageGalleryImagesController < ApplicationController
  # GET /image_gallery_images
  # GET /image_gallery_images.xml
  
    before_filter :load_image_gallery_group
    
    def load_image_gallery_group
        @image_gallery_group = ImageGalleryGroup.find(params[:image_gallery_group_id])
    end
  
  # GET /image_gallery_images/new
  # GET /image_gallery_images/new.xml
  def new
    @image_gallery_image = @image_gallery_group.images.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image_gallery_image }
    end
  end

  # GET /image_gallery_images/1/edit
  def edit
    @image_gallery_image = @image_gallery_group.images.find(params[:id])
  end

  # POST /image_gallery_images
  # POST /image_gallery_images.xml
  def create
    @image_gallery_image = @image_gallery_group.images.new(params[:image_gallery_image])

    respond_to do |format|
      if @image_gallery_image.save
        flash[:notice] = 'ImageGalleryImage was successfully created.'
        format.html { redirect_to([:admin, @image_gallery_group]) }
        format.xml  { render :xml => @image_gallery_group, :status => :created, :location => @image_gallery_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image_gallery_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /image_gallery_images/1
  # PUT /image_gallery_images/1.xml
  def update
    @image_gallery_image = ImageGalleryImage.find(params[:id])

    respond_to do |format|
      if @image_gallery_image.update_attributes(params[:image_gallery_image])
        flash[:notice] = 'ImageGalleryImage was successfully updated.'
        format.html { redirect_to([:admin, @image_gallery_group]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image_gallery_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /image_gallery_images/1
  # DELETE /image_gallery_images/1.xml
  def destroy
    @image_gallery_image = ImageGalleryImage.find(params[:id])
    @image_gallery_image.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @image_gallery_group]) }
      format.xml  { head :ok }
    end
  end
 end
end
