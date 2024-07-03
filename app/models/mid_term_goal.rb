class MidTermGoal < ApplicationRecord
  belongs_to :user
  belongs_to :long_term_goal
  has_many :feedbacks

  validates :mid_goal, presence: true
  validates :priority, presence: true
  validates :what_to_do, presence: true
  validates :why_to_do, presence: true
  validates :current_status, presence: true
  validates :what_next, presence: true
  validates :mid_goal_deadline, presence: true
  
  validates :is_complete, inclusion: { in: [true, false] }
end
