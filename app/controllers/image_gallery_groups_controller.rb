
class ImageGalleryGroupsController < ApplicationController

    def title
        return "Gallery - " + ImageGalleryGroup.find( params[ :id ] ).title.capitalize if (params && params[ :id ])
        return "Gallery"
    end
  before_filter :go_home, :except => [:show]

    # GET /image_gallery_groups
    # GET /image_gallery_groups.xml
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
end
