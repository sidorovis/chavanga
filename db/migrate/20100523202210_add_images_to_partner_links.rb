class AddImagesToPartnerLinks < ActiveRecord::Migration
  def self.up
    add_column :partner_links, :image, :string
    add_column :partner_links, :publish_image, :boolean
  end

  def self.down
    remove_column :partner_links, :publish_image
    remove_column :partner_links, :image
  end
end
