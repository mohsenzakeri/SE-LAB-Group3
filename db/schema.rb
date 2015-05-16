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

ActiveRecord::Schema.define(version: 20150514122052) do

  create_table "game_alphabets", force: true do |t|
    t.integer  "game_id"
    t.integer  "round_number"
    t.string   "alphabet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_judges", force: true do |t|
    t.integer  "game_round_id"
    t.boolean  "firstname"
    t.boolean  "lastname"
    t.boolean  "city"
    t.boolean  "country"
    t.boolean  "fruit"
    t.boolean  "car"
    t.boolean  "color"
    t.boolean  "job"
    t.boolean  "food"
    t.boolean  "thing"
    t.boolean  "animal"
    t.boolean  "flower"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_rounds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "city"
    t.string   "country"
    t.string   "fruit"
    t.string   "car"
    t.string   "color"
    t.string   "job"
    t.string   "food"
    t.string   "thing"
    t.string   "animal"
    t.string   "flower"
    t.integer  "round_number"
    t.integer  "user_game_id"
  end

  create_table "games", force: true do |t|
    t.integer  "creator_id"
    t.integer  "players_num"
    t.integer  "rounds_num"
    t.integer  "joined_players"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.integer  "gameround_id"
    t.string   "alphabet"
  end

  create_table "tests", force: true do |t|
    t.string   "test_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.integer  "round_number"
    t.integer  "value"
  end

  create_table "user_games", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round_number"
    t.integer  "score"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname",                            null: false
    t.datetime "birthdate"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
