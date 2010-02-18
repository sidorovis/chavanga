class CreateImageGalleryGroups < ActiveRecord::Migration
  def self.up
    create_table :image_gallery_groups do |t|
      t.string :title
      t.text :description
      t.integer :parent_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :image_gallery_groups
  end
end
