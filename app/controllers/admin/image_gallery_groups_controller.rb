module Admin
 class ImageGalleryGroupsController < ApplicationController


  def index
    @image_gallery_groups = ImageGalleryGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @image_gallery_groups }
    end
  end

  # GET /image_gallery_groups/1
  # GET /image_gallery_groups/1.xml
  def show
    @@pict_per_page = 20
    @image_gallery_group = ImageGalleryGroup.find(params[:id])
    @image_gallery_group = ImageGalleryGroup.find( params[ :id ] )
    @page_count = 1 + @image_gallery_group.all_images_size / @@pict_per_page
    @page_count -= 1 if (@image_gallery_group.all_images_size % @@pict_per_page == 0 && @page_count > 1)
    pre = params[ :page ].to_i
    pre = 1 if (pre <= 0 || pre > @page_count )
    @page = pre
    @all_images, d = @image_gallery_group.get_images( (@page - 1) * @@pict_per_page, @@pict_per_page )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image_gallery_group }
    end
  end

  # GET /image_gallery_groups/new
  # GET /image_gallery_groups/new.xml
  def new
    @image_gallery_group = ImageGalleryGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image_gallery_group }
    end
  end

  # GET /image_gallery_groups/1/edit
  def edit
    @image_gallery_group = ImageGalleryGroup.find(params[:id])
  end

  # POST /image_gallery_groups
  # POST /image_gallery_groups.xml
  def create
    @image_gallery_group = ImageGalleryGroup.new(params[:image_gallery_group])

    respond_to do |format|
      if @image_gallery_group.save
        if ( @image_gallery_group.parent_group_id == nil )
            @image_gallery_group.parent_group_id = @image_gallery_group.id;
            @image_gallery_group.save;
        end
        flash[:notice] = 'ImageGalleryGroup was successfully created.'
        format.html { redirect_to([:admin, @image_gallery_group]) }
        format.xml  { render :xml => @image_gallery_group, :status => :created, :location => @image_gallery_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image_gallery_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /image_gallery_groups/1
  # PUT /image_gallery_groups/1.xml
  def update
    @image_gallery_group = ImageGalleryGroup.find(params[:id])

    respond_to do |format|
      if @image_gallery_group.update_attributes(params[:image_gallery_group])
        flash[:notice] = 'ImageGalleryGroup was successfully updated.'
        format.html { redirect_to([:admin, @image_gallery_group]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image_gallery_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /image_gallery_groups/1
  # DELETE /image_gallery_groups/1.xml
  def destroy
    @image_gallery_group = ImageGalleryGroup.find(params[:id])
    @image_gallery_group.destroy

    respond_to do |format|
      format.html { redirect_to( admin_image_gallery_groups_url ) }
      format.xml  { head :ok }
    end
  end
 end
end