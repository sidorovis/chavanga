class CreatePartnerLinks < ActiveRecord::Migration
  def self.up
    create_table :partner_links do |t|
      t.string :title
      t.string :tag
      t.boolean :visible

      t.timestamps
    end
  end

  def self.down
    drop_table :partner_links
  end
end
