class SubFishingProgram < ActiveRecord::Base
    belongs_to  :fishing_program 
    validates_presence_of :title, :fishing_program_id
end
