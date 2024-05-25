class Goal < ApplicationRecord
  belongs_to :user
  has_many :feedbacks

  enum priority: { low: 0, medium: 1, high: 2 }

  validates :priority, presence: true
  validates :long_term_goal, length: { maximum: 255 }
  validates :mid_term_goal, length: { maximum: 255 }
end
