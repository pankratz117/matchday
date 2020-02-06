# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_06_112158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: :cascade do |t|
    t.bigint "matchday_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matchday_id"], name: "index_goals_on_matchday_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "matchdays", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "sport_type"
    t.date "date"
    t.integer "red_score"
    t.integer "blue_score"
    t.string "mode"
    t.bigint "sports_ground_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sports_ground_id"], name: "index_matchdays_on_sports_ground_id"
    t.index ["user_id"], name: "index_matchdays_on_user_id"
  end

  create_table "sports_grounds", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.string "photo_1"
    t.string "photo_2"
    t.string "photo_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "matchday_id", null: false
    t.boolean "team_red"
    t.boolean "team_blue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matchday_id"], name: "index_spots_on_matchday_id"
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "goals", "matchdays"
  add_foreign_key "goals", "users"
  add_foreign_key "matchdays", "sports_grounds"
  add_foreign_key "matchdays", "users"
  add_foreign_key "spots", "matchdays"
  add_foreign_key "spots", "users"
end
