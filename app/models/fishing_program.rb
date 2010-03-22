class FishingProgram < ActiveRecord::Base
    has_many :FishingProgramImages
    has_many :SubFishingPrograms
    belongs_to :image_gallery_group
end
