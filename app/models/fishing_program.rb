class FishingProgram < ActiveRecord::Base
    has_many :FishingProgramImages
    belongs_to :image_gallery_group
end
