class AddVisibleIntoMainMenuToImageGalleryGroup < ActiveRecord::Migration
  def self.up
    add_column :image_gallery_groups, :visible, :boolean, :default => false
  end

  def self.down
    remove_column :image_gallery_groups, :visible
  end
end
