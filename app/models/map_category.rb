class MapCategory < ActiveRecord::Base
    has_many    :maps
    validates_presence_of :title
end
