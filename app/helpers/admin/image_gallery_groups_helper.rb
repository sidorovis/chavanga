module Admin
 module ImageGalleryGroupsHelper
    def admin_image_gallery_group_path( igi )
        '/admin/image_gallery_groups/'+igi.id.to_s
    end
    def PER_COLUMN()
        4
    end
 end
end