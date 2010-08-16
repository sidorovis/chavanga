class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :title
      t.text :body
      t.string :tag
      t.boolean :visible
      t.integer :map_category_id

      t.timestamps
    end
    
    # habarovsk region
    m_h1 = Map.new
    m_h1.title = "Program 1"
    m_h1.visible = true
    m_h1.map_category_id = 1
    m_h1.tag = "map/habarovsk_region/h1.jpg"
    m_h1.save

    m_h2 = Map.new
    m_h2.title = "Program 1"
    m_h2.visible = false
    m_h2.map_category_id = 1
    m_h2.tag = "map/habarovsk_region/h2.jpg"
    m_h2.save
    
    # kamchatka region
    m_k1 = Map.new
    m_k1.title = "Program 2"
    m_k1.visible = true
    m_k1.map_category_id = 2
    m_k1.tag = "map/kamchatka_peninsula/k1.jpg"
    m_k1.save
    
    m_k2 = Map.new
    m_k2.title = "Program 2"
    m_k2.visible = false
    m_k2.map_category_id = 2
    m_k2.tag = "map/kamchatka_peninsula/k2.jpg"
    m_k2.save
    
    m_k3 = Map.new
    m_k3.title = "Program 2"
    m_k3.visible = false
    m_k3.map_category_id = 2
    m_k3.tag = "map/kamchatka_peninsula/k3.jpg"
    m_k3.save
    
    m_k4 = Map.new
    m_k4.title = "Program 2"
    m_k4.visible = false
    m_k4.map_category_id = 2
    m_k4.tag = "map/kamchatka_peninsula/k4.jpg"
    m_k4.save

    # kola peninsula
    m_ko1 = Map.new
    m_ko1.title = "Program 3"
    m_ko1.visible = true
    m_ko1.map_category_id = 3
    m_ko1.tag = "map/kola_peninsula/ko1.jpg"
    m_ko1.save
    
  end

  def self.down
    drop_table :maps
  end
end
