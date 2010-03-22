class CreateSubFishingPrograms < ActiveRecord::Migration
  def self.up
    create_table :sub_fishing_programs do |t|
      t.string :title
      t.text :body
      t.boolean :visible
      t.integer :fishing_program_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_fishing_programs
  end
end
