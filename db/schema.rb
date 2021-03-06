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

ActiveRecord::Schema.define(version: 20160609213231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_codes", force: :cascade do |t|
    t.integer  "stylist_id"
    t.integer  "team_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "connection_key"
  end

  add_index "access_codes", ["stylist_id"], name: "index_access_codes_on_stylist_id", using: :btree
  add_index "access_codes", ["team_id"], name: "index_access_codes_on_team_id", using: :btree

  create_table "adviceboards", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "adviceboards", ["user_id"], name: "index_adviceboards_on_user_id", using: :btree

  create_table "dashboards", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "stylist_id"
  end

  add_index "dashboards", ["stylist_id"], name: "index_dashboards_on_stylist_id", using: :btree
  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id", using: :btree

  create_table "fashionboards", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
  end

  add_index "fashionboards", ["member_id"], name: "index_fashionboards_on_member_id", using: :btree
  add_index "fashionboards", ["user_id"], name: "index_fashionboards_on_user_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feedbacks", ["item_id"], name: "index_feedbacks_on_item_id", using: :btree
  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "target_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follows", ["target_id", "user_id"], name: "index_follows_on_target_id_and_user_id", using: :btree
  add_index "follows", ["target_id"], name: "index_follows_on_target_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "message"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "item_image_id"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pins", ["item_id"], name: "index_pins_on_item_id", using: :btree
  add_index "pins", ["user_id"], name: "index_pins_on_user_id", using: :btree

  create_table "profile_contents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "profile_image_id"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "profile_title"
    t.text     "first_section"
    t.text     "second_section"
    t.text     "third_section"
  end

  add_index "profile_contents", ["user_id"], name: "index_profile_contents_on_user_id", using: :btree

  create_table "stylists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "count",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "stylist"
    t.string   "status"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_image_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "feedbacks", "items"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "items", "users"
  add_foreign_key "pins", "items"
  add_foreign_key "pins", "users"
end
