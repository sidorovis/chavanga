class ImageGalleryGroup < ActiveRecord::Base
    belongs_to  :parent_group, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :parent_group_id
    has_many    :subgroups, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :parent_group_id, 
                :conditions => [ "parent_group_id != id" ], 
                :dependent => :destroy
    has_many    :images, 
                :class_name => 'ImageGalleryImage', 
                :foreign_key => :image_gallery_group_id, 
                :dependent => :destroy
    validates_presence_of :title
    def all_images(limit = 20)
        places = limit
        result = images.all( :limit => places, :order => "created_at DESC" )
        places = places - result.size
        subgroups.each do |group| 
            group_images = group.all_images( places )
            places -= group_images.size
            result += group_images
        end
        result
    end
    def all_images_size
        result = images.count( )
        subgroups.each do |group| 
            result += group.all_images_size
        end
        result
    end
    
end
