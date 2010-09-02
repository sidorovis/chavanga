class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.integer :value

      t.timestamps
    end
    red = Color.new
    red.value = "ff0000".hex
    red.save
    black = Color.new
    black.value = "000000".hex
    black.save
    yellow = Color.new
    yellow.value = "FFFF00".hex
    yellow.save
    blue = Color.new
    blue.value = "00FFFF".hex
    blue.save
    green = Color.new
    green.value = "00FF00".hex
    green.save
  end

  def self.down
    drop_table :colors
  end
end
