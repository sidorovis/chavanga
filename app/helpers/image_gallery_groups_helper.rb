module ImageGalleryGroupsHelper
    def image_gallery_group_path( igi )
        '/image_gallery_groups/'+igi.id.to_s
    end
    def new_image_gallery_group_ima2ge_gallery_image_path( path )
        ""
    end
    def edit_image_gallery_group_image2_gallery_image_path( o1, o2 )
        ""
    end
    def BORDER()
        20
    end
    def PER_COLUMN()
        4
    end
end
