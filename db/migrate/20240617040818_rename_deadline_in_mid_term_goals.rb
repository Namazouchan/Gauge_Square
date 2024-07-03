class RenameDeadlineInMidTermGoals < ActiveRecord::Migration[7.1]
  def change
    rename_column :mid_term_goals, :deadline, :mid_goal_deadline
  end
end
