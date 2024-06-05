class AddIsCompleteToGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :long_term_goals, :is_complete, :boolean, default: false, null: false
    add_column :mid_term_goals, :is_complete, :boolean, default: false, null: false
  end
end
