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

ActiveRecord::Schema.define(:version => 20101218162443) do

  create_table "buys", :force => true do |t|
    t.integer  "quant"
    t.integer  "good_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", :force => true do |t|
    t.text     "name",       :null => false
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", :force => true do |t|
    t.text     "name",       :null => false
    t.float    "size_x"
    t.float    "size_y"
    t.float    "size_z"
    t.float    "weight"
    t.text     "about"
    t.float    "price"
    t.integer  "quant"
    t.text     "provider"
    t.integer  "catalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "status"
    t.text     "comment"
    t.text     "contact"
    t.datetime "created_at"
    t.integer  "user_id"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.string   "bday"
    t.string   "bmounth"
    t.string   "byear"
    t.string   "gender"
    t.datetime "updated_at"
  end

end
