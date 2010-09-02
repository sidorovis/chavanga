class CreateTextEffects < ActiveRecord::Migration
  def self.up
    create_table :text_effects do |t|
      t.string :title
      t.text :effect_code
      t.text :example_code

      t.timestamps
    end
  end

  def self.down
    drop_table :text_effects
  end
end
