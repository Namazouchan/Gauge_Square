class LongTermGoal < ApplicationRecord
  belongs_to :user
  has_many :mid_term_goals
  has_many :feedbacks
end
