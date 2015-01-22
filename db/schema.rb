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

ActiveRecord::Schema.define(version: 20150122121249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "postcode"
    t.text     "organisation"
    t.text     "contact_name"
    t.text     "full_address"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "description"
    t.string   "dried_goods"
    t.string   "snacks"
    t.string   "cooking_ingredients"
    t.string   "drinks"
    t.string   "uht_milk"
    t.string   "cereals"
    t.string   "tins",                   default: "0"
    t.text     "website_url"
    t.string   "coffee_and_tea"
    t.string   "fresh_fruit_and_veg"
    t.string   "fresh_meat_and_fish"
    t.string   "jars_and_condiments"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "weekend_opening_hours"
    t.text     "weekday_opening_hours"
  end

  add_index "charities", ["email"], name: "index_charities_on_email", unique: true, using: :btree
  add_index "charities", ["reset_password_token"], name: "index_charities_on_reset_password_token", unique: true, using: :btree

end
