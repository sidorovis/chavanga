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

ActiveRecord::Schema.define(:version => 20100218133835) do

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
  end

  create_table "image_gallery_groups", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "parent_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",         :default => false
  end

  create_table "partner_links", :force => true do |t|
    t.string   "title"
    t.string   "tag"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
