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

ActiveRecord::Schema.define(version: 20171222230324) do

  create_table "access_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card", primary_key: "card_id", force: :cascade do |t|
    t.string "user", null: false
    t.string "nick"
    t.string "after_hours", limit: 1, null: false
    t.datetime "expires", null: false
    t.datetime "valid_from", null: false
    t.string "disabled", limit: 1, null: false
    t.string "magic", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "door", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "default_unlocked", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
