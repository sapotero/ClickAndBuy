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

ActiveRecord::Schema.define(version: 20140301193730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "discount"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counters", force: true do |t|
    t.integer  "like_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "counters", ["like_id", "user_id"], name: "index_counters_on_like_id_and_user_id", unique: true, using: :btree
  add_index "counters", ["like_id"], name: "index_counters_on_like_id", using: :btree
  add_index "counters", ["user_id"], name: "index_counters_on_user_id", using: :btree

  create_table "discounts", force: true do |t|
    t.integer  "discount"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likes"
    t.integer  "count"
    t.boolean  "active"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.boolean  "published"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "shop_id"
    t.date     "end_date"
    t.integer  "code_id"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "item_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ended",      default: false
  end

  add_index "likes", ["item_id"], name: "index_likes_on_item_id", using: :btree
  add_index "likes", ["user_id", "item_id"], name: "index_likes_on_user_id_and_item_id", unique: true, using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.string   "position"
  end

  create_table "partner_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", force: true do |t|
    t.text     "company"
    t.string   "activity"
    t.text     "name"
    t.text     "phone"
    t.text     "email"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "url"
    t.string   "fb"
    t.string   "vk"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "blocked"
    t.integer  "p_type"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.integer  "order",                     default: 0
    t.integer  "parent",                    default: 0
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "order",  default: 0
    t.integer "parent", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
    t.integer  "owned_shop",             default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "date"
    t.boolean  "gender"
    t.string   "country"
    t.string   "vk"
    t.string   "fb"
    t.string   "tw"
    t.string   "od"
    t.boolean  "is_banned",              default: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "votes",                  default: 5
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
