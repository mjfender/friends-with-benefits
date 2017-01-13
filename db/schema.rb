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


ActiveRecord::Schema.define(version: 20170113141559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "location"
    t.datetime "time"
    t.text     "description"
    t.integer  "need_id"
    t.string   "title"
  end

  create_table "group_needs", force: :cascade do |t|
    t.integer  "need_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_needs_on_group_id", using: :btree
    t.index ["need_id"], name: "index_group_needs_on_need_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.boolean  "open",               default: true
    t.string   "title"
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "location"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "memberships_count"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "admin",          default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "request_admin"
    t.datetime "request_invite"
    t.boolean  "approved"
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "needs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "headline"
    t.text     "description"
    t.datetime "expiration"
    t.text     "perk"
    t.boolean  "completed",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_needs_on_user_id", using: :btree
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "need_id"
    t.text     "comment"
    t.boolean  "yes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["need_id"], name: "index_replies_on_need_id", using: :btree
    t.index ["user_id"], name: "index_replies_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "photo"
    t.string   "zipcode"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "default_group",       default: 1
    t.string   "admin",               default: "f"
    t.integer  "logins_count",        default: 0
    t.datetime "logins_last"
  end

  add_foreign_key "group_needs", "groups"
  add_foreign_key "group_needs", "needs"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
end
