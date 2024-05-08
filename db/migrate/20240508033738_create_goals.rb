class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :long_term_goal
      t.string :mid_term_goal
      t.text :what_to_do
      t.text :why_to_do
      t.text :current_status
      t.text :why_current_status
      t.text :what_next
      t.integer :priority, null: false, default: 1
      t.datetime :deadline

      t.timestamps
    end
  end
end
