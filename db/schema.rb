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

ActiveRecord::Schema[7.1].define(version: 2024_05_08_033821) do
  create_table "feedbacks", force: :cascade do |t|
    t.integer "goal_id", null: false
    t.integer "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_feedbacks_on_goal_id"
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

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "feedbacks", "goals"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "goals", "users"
end
