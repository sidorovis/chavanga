class CreateImageGalleryImages < ActiveRecord::Migration
  def self.up
    create_table :image_gallery_images do |t|
      t.string :title
      t.text :description
      t.string :tag
      t.boolean :visible
      t.integer :image_gallery_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :image_gallery_images
  end
end
