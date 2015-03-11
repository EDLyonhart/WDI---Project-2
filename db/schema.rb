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

ActiveRecord::Schema.define(version: 20150311030255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "uid"
    t.boolean  "is_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "housings", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "type"
    t.integer  "bedrooms"
    t.string   "bathrooms"
    t.string   "integer"
    t.integer  "sq_footage"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "likee"
    t.boolean  "is_matched"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "rejected",   default: false
  end

  create_table "pets", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "type"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "has"
    t.integer  "user_id"
  end

  create_table "resources_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "has_user_id"
    t.integer  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "resource_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.string   "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "socials", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "interests",   default: [],              array: true
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_pic"
    t.string   "location"
    t.string   "gender"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "uid",           limit: 8
    t.integer  "score",                   default: 1
    t.boolean  "has_bike",                default: false
    t.boolean  "has_housing",             default: false
    t.boolean  "has_pet",                 default: false
    t.boolean  "has_social",              default: false
    t.boolean  "has_vehicle",             default: false
    t.boolean  "wants_bike",              default: false
    t.boolean  "wants_housing",           default: false
    t.boolean  "wants_pet",               default: false
    t.boolean  "wants_social",            default: false
    t.boolean  "wants_vehicle",           default: false
  end

  create_table "users_friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

end
