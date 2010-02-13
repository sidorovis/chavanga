class CreateFishingProgramImages < ActiveRecord::Migration
  def self.up
    create_table :fishing_program_images do |t|
      t.string :title
      t.string :tag
      t.integer :fishing_program_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fishing_program_images
  end
end
