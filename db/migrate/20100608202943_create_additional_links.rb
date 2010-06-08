class CreateAdditionalLinks < ActiveRecord::Migration
  def self.up
    create_table :additional_links do |t|
      t.string :title
      t.string :tag
      t.boolean :published

      t.timestamps
    end
    
    AdditionalLink.create :title => "Your visa support",
            :tag => "http://blog.chavanga.com/2010/04/your-visa-support.html",
            :published => true
  end

  def self.down
    drop_table :additional_links
  end
end
