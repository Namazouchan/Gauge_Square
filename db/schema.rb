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

ActiveRecord::Schema[7.1].define(version: 2024_06_09_021441) do
  create_table "feedbacks", force: :cascade do |t|
    t.integer "mid_term_goal_id"
    t.integer "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mid_term_goal_id"], name: "index_feedbacks_on_mid_term_goal_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "long_term_goal"
    t.string "mid_term_goal"
    t.text "what_to_do"
    t.text "why_to_do"
    t.text "current_status"
    t.text "why_current_status"
    t.text "what_next"
    t.integer "priority", default: 1, null: false
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "long_term_goals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "long_goal", null: false
    t.datetime "deadline"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "is_complete", default: false, null: false
    t.index ["user_id"], name: "index_long_term_goals_on_user_id"
  end

  create_table "mid_term_goals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "long_term_goal_id", null: false
    t.string "mid_goal", null: false
    t.text "what_to_do"
    t.text "why_to_do"
    t.text "current_status"
    t.text "why_current_status"
    t.text "what_next"
    t.integer "priority", null: false
    t.datetime "deadline"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "is_complete", default: false, null: false
    t.index ["long_term_goal_id"], name: "index_mid_term_goals_on_long_term_goal_id"
    t.index ["user_id"], name: "index_mid_term_goals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "feedbacks", "mid_term_goals"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "long_term_goals", "users"
  add_foreign_key "mid_term_goals", "long_term_goals"
  add_foreign_key "mid_term_goals", "users"
end
