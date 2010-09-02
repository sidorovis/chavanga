class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :title
      t.boolean :does_image
      t.string :value
      t.string :href
      t.string :alt

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
