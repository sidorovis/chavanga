class ImageGalleryGroup < ActiveRecord::Base
    belongs_to  :parent_group, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :parent_group_id
    has_many    :subgroups, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :parent_group_id, 
                :conditions => [ "parent_group_id != id" ], 
                :dependent => :destroy
    validates_presence_of :title
end
