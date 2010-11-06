class CreatePostComments < ActiveRecord::Migration
  def self.up
    create_table :post_comments do |t|
      t.string :author
      t.text :answer
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :post_comments
  end
end
