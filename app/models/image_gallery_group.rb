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
    def all_images
        result = images.all( :conditions => { :visible => true } )
        subgroups.each { |group| (result += group.all_images if result.size < 18 ) }
        result
    end
    
end
