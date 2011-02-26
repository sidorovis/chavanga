class ImageGalleryImage < ActiveRecord::Base
    belongs_to  :group, 
                :class_name => 'ImageGalleryGroup', 
                :foreign_key => :image_gallery_group_id
    validates_presence_of :title, :tag

    has_attached_file :photo, :styles => { :small => "170x170>" },
                  :url  => "/images/new_gallery/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/images/new_gallery/:id/:style/:basename.:extension"

    validates_attachment_presence :photo
    validates_attachment_size :photo, :less_than => 3.megabytes
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
