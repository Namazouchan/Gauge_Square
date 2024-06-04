class FeedbackTables < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :long_term_goal, foreign_key: true
      t.references :mid_term_goal, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
