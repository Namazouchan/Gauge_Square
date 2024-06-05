class MidTermGoal < ApplicationRecord
  belongs_to :user
  belongs_to :long_term_goal
  has_many :feedbacks
end
