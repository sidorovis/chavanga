class ImageGalleryGroup < ActiveRecord::Base

    belongs_to  :parent_group, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :parent_group_id
    has_many    :subgroups, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :parent_group_id, 
                :conditions => [ "parent_group_id != id" ], 
                :order => "created_at DESC",
                :dependent => :destroy
    has_many    :images, 
                :class_name => 'ImageGalleryImage', 
                :foreign_key => :image_gallery_group_id, 
                :order => "created_at DESC",
                :dependent => :destroy
    validates_presence_of :title
    
    def get_images( should_miss = 0, count = 20 )
        result = []
        size = images.count
        if ( size > should_miss )
            result += images.all( :offset => should_miss, :limit => count, :order => "created_at DESC" )
            should_miss = 0
        else
            should_miss -= size
        end
        subgroups.each do |group| 
            group_images, should_miss = group.get_images( should_miss, count - result.size )
            result += group_images
            return [result, should_miss] if (result.size == count)
        end
        return result, should_miss
    end
    def all_images_size
        return @size if (@size != nil)
        result = images.count( )
        subgroups.each do |group| 
            result += group.all_images_size
        end
        @size = result
    end
    
end
