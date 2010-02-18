module ImageGalleryGroupsHelper
    def image_gallery_group_path( igi )
        '/image_gallery_group/'+igi.id.to_s
    end
end
