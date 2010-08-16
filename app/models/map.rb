class Map < ActiveRecord::Base
    belongs_to  :map_category
    validates_presence_of :title, :tag, :map_category_id    
end
