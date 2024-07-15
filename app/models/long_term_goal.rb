class LongTermGoal < ApplicationRecord
  belongs_to :user
  has_many :mid_term_goals
  has_many :feedbacks
  has_many :mid_term_goals, dependent: :destroy

  validates :long_goal, presence: true
  validates :is_complete, inclusion: { in: [true, false] }
end
