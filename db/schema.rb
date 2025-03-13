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

ActiveRecord::Schema[8.0].define(version: 2025_03_10_172612) do
  create_table "matches", force: :cascade do |t|
    t.integer "player_1_id", null: false
    t.integer "player_2_id", null: false
    t.integer "wins1"
    t.integer "wins2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_1_id"], name: "index_matches_on_player_1_id"
    t.index ["player_2_id"], name: "index_matches_on_player_2_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "players", column: "player_1_id"
  add_foreign_key "matches", "players", column: "player_2_id"
end
