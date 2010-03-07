class AddHiddenFieldToFishingPrograms < ActiveRecord::Migration
  def self.up
    add_column :fishing_programs, :hidden, :boolean
  end

  def self.down
    remove_column :fishing_programs, :hidden
  end
end
