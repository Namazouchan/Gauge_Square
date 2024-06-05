class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :long_term_goal, optional: true
  belongs_to :mid_term_goal, optional: true

  validates :content, presence: true
end