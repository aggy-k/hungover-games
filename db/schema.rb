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

ActiveRecord::Schema.define(version: 2019_04_24_033907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendee_statuses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_statuses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "timeslot_id"
    t.date "date"
    t.datetime "signup_time"
    t.text "description"
    t.text "announcement"
    t.bigint "game_status_id"
    t.string "location"
    t.integer "max_capacity"
    t.integer "attendees_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_status_id"], name: "index_games_on_game_status_id"
    t.index ["timeslot_id"], name: "index_games_on_timeslot_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "signups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.bigint "attendee_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_status_id"], name: "index_signups_on_attendee_status_id"
    t.index ["game_id"], name: "index_signups_on_game_id"
    t.index ["user_id"], name: "index_signups_on_user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.string "day"
    t.datetime "default_signup_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_time"
    t.datetime "start_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "wechat_id"
    t.string "username"
    t.string "profile_image"
    t.string "first_name"
    t.string "last_name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "game_statuses"
  add_foreign_key "games", "timeslots"
  add_foreign_key "games", "users"
  add_foreign_key "signups", "attendee_statuses"
  add_foreign_key "signups", "games"
  add_foreign_key "signups", "users"
end
