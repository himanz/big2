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

ActiveRecord::Schema.define(version: 20141126070336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.string   "nickname"
    t.string   "player1"
    t.string   "player2"
    t.string   "player3"
    t.string   "player4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount"
  end

  create_table "hands", force: true do |t|
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
