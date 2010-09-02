class TextEffect < ActiveRecord::Base
    validates_presence_of :title, :example_code    
end
