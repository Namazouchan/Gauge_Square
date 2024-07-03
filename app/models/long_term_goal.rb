class LongTermGoal < ApplicationRecord
  belongs_to :user
  has_many :mid_term_goals
  has_many :feedbacks

  validates :long_goal, presence: true
  validates :is_complete, inclusion: { in: [true, false] }
end
