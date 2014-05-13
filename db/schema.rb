# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140510220508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: true do |t|
    t.integer  "price"
    t.integer  "year"
    t.integer  "visit_count"
    t.integer  "gears"
    t.integer  "engine_size"
    t.integer  "cylinders"
    t.string   "paper_status"
    t.string   "color"
    t.string   "transmission_type"
    t.string   "description"
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "strokes"
  end

  add_index "ads", ["user_id"], name: "index_ads_on_user_id", using: :btree
  add_index "ads", ["vehicle_id"], name: "index_ads_on_vehicle_id", using: :btree

  create_table "brands", force: true do |t|
    t.string "name", null: false
  end

  add_index "brands", ["name"], name: "index_brands_on_name", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree

  create_table "models", force: true do |t|
    t.string  "name",     null: false
    t.integer "brand_id"
  end

  add_index "models", ["name"], name: "index_models_on_name", using: :btree

  create_table "styles", force: true do |t|
    t.string  "name",        null: false
    t.string  "photo_path",  null: false
    t.string  "description", null: false
    t.integer "type_id"
  end

  add_index "styles", ["name"], name: "index_styles_on_name", using: :btree

  create_table "types", force: true do |t|
    t.string "name", null: false
  end

  add_index "types", ["name"], name: "index_types_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "last_name",       null: false
    t.string   "cellphone",       null: false
    t.string   "phone"
    t.string   "address"
    t.string   "email",           null: false
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "auth_token"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "vehicles", force: true do |t|
    t.integer "model_id"
    t.integer "style_id"
  end

end
