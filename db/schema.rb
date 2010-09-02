# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100902221016) do

  create_table "additional_links", :force => true do |t|
    t.string   "title"
    t.string   "tag"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.boolean  "does_image"
    t.string   "value"
    t.string   "href"
    t.string   "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "colors", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fishing_program_images", :force => true do |t|
    t.string   "title"
    t.string   "tag"
    t.integer  "fishing_program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fishing_programs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "page_content"
    t.integer  "image_gallery_group_id"
    t.boolean  "hidden"
  end

  create_table "image_gallery_groups", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "parent_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",         :default => false
  end

  create_table "image_gallery_images", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "tag"
    t.boolean  "visible"
    t.integer  "image_gallery_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_categories", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "tag"
    t.boolean  "visible"
    t.integer  "map_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partner_links", :force => true do |t|
    t.string   "title"
    t.string   "tag"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "publish_image"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_fishing_programs", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "visible"
    t.integer  "fishing_program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_effects", :force => true do |t|
    t.string   "title"
    t.text     "effect_code"
    t.text     "example_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
