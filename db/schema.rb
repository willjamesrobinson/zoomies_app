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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_002231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doggy_dates", force: :cascade do |t|
    t.date "date"
    t.string "location"
    t.bigint "match_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_doggy_dates_on_match_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "size"
    t.string "breed"
    t.string "personality", array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "matchee_id"
    t.bigint "matcher_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matchee_id"], name: "index_matches_on_matchee_id"
    t.index ["matcher_id"], name: "index_matches_on_matcher_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_messages_on_match_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "overview"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doggy_dates", "matches"
  add_foreign_key "dogs", "users"
  add_foreign_key "matches", "users", column: "matchee_id"
  add_foreign_key "matches", "users", column: "matcher_id"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "users"
end
