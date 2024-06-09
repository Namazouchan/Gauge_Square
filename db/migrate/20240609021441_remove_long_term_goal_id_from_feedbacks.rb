class RemoveLongTermGoalIdFromFeedbacks < ActiveRecord::Migration[7.1]
  def change
    remove_column :feedbacks, :long_term_goal_id, :integer
  end
end
