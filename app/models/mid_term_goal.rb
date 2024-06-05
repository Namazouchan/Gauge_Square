class MidTermGoal < ApplicationRecord
  belongs_to :user
  belongs_to :long_term_goal
  has_many :feedbacks

  validates :mid_goal, presence: true
  validates :priority, presence: true
  validates :is_complete, inclusion: { in: [true, false] }
end
