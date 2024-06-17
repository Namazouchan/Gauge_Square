class RenameDeadlineInLongTermGoals < ActiveRecord::Migration[7.1]
  def change
    rename_column :long_term_goals, :deadline, :long_goal_deadline
  end
end
