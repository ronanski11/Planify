# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_20_112725) do
  create_table "cancellations", force: :cascade do |t|
    t.integer "participation_id"
    t.text "reason"
    t.datetime "cancelled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participation_id"], name: "index_cancellations_on_participation_id"
  end

  create_table "game_events", force: :cascade do |t|
    t.string "event_name"
    t.datetime "event_date"
    t.string "location"
    t.integer "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_game_events_on_coach_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_event_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_event_id"], name: "index_participations_on_game_event_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_confirmation"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "email"
  end

  add_foreign_key "cancellations", "participations"
  add_foreign_key "game_events", "users", column: "coach_id"
  add_foreign_key "participations", "game_events"
  add_foreign_key "participations", "users"
end
