class ImageGalleryImage < ActiveRecord::Base
    belongs_to  :group, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :image_gallery_group_id
    validates_presence_of :title, :tag
end
