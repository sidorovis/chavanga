class AddImageGalleryGroupdIdToFishingProgram < ActiveRecord::Migration
  def self.up
    add_column :fishing_programs, :image_gallery_group_id, :integer
  end

  def self.down
    remove_column :fishing_programs, :image_gallery_group_id
  end
end
