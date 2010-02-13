class CreateFishingPrograms < ActiveRecord::Migration
  def self.up
    create_table :fishing_programs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :fishing_programs
  end
end
