module ImageGalleryGroupsHelper
    def image_gallery_group_path( igi )
        '/image_gallery_groups/'+igi.id.to_s
    end
    def PER_COLUMN()
        4
    end
end
