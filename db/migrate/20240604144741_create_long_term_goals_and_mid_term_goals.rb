class CreateLongTermGoalsAndMidTermGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :long_term_goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :long_goal, null: false
      t.datetime :deadline
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    create_table :mid_term_goals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :long_term_goal, null: false, foreign_key: true
      t.string :mid_goal, null: false
      t.text :what_to_do
      t.text :why_to_do
      t.text :current_status
      t.text :why_current_status
      t.text :what_next
      t.integer :priority, null: false
      t.datetime :deadline
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
