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

ActiveRecord::Schema.define(version: 20150726140327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.integer  "starter_id"
    t.integer  "target_id"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.boolean  "draw"
    t.text     "battle_log", default: ""
    t.integer  "match_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cosmetic_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.float    "damage"
    t.float    "defense"
    t.string   "type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image_path"
    t.string   "cosmetic_type"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.float    "damage"
    t.float    "defense"
    t.string   "type"
    t.integer  "player_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_path"
  end

  create_table "matches", force: :cascade do |t|
    t.time     "turn_start_time", default: '2000-01-01 14:46:09'
    t.time     "turn_final_time", default: '2000-01-01 14:46:09'
    t.integer  "winner_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deaths",        default: 0
    t.integer  "kills",         default: 0
    t.integer  "gold",          default: 100
    t.integer  "exp",           default: 0
    t.float    "hp_max",        default: 100.0
    t.float    "hp_min",        default: 100.0
    t.float    "mp_max",        default: 20.0
    t.float    "mp_min",        default: 20.0
    t.float    "damage",        default: 15.0
    t.boolean  "atacable",      default: false
    t.float    "defense",       default: 0.0
    t.integer  "match_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "level",         default: 1
    t.string   "state",         default: "city"
    t.float    "extra_defense", default: 0.0
    t.float    "extra_damage",  default: 0.0
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.string   "nickname"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "remember_token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
