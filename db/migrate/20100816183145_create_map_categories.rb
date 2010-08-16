class CreateMapCategories < ActiveRecord::Migration
  def self.up
    create_table :map_categories do |t|
      t.string :title
      t.text :body
      t.string :tag

      t.timestamps
    end
    mp_habarovsk = MapCategory.new
    mp_habarovsk.title = "Habarovsk programs"
    mp_habarovsk.tag = "habarovsk_region"
    mp_habarovsk.save
    
    mp_kamchatka = MapCategory.new
    mp_kamchatka.title = "Kamchatka peninsula"
    mp_kamchatka.tag = "kamchatka_peninsula"
    mp_kamchatka.save
    
    mp_kola = MapCategory.new
    mp_kola.title = "Kola programs"
    mp_kola.tag = "kola_peninsula"
    mp_kola.save
    
  end

  def self.down
    drop_table :map_categories
  end
end
