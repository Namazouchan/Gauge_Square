class User < ApplicationRecord
  has_secure_password
  
  has_many :long_term_goals
  has_many :mid_term_goals
  has_many :feedbacks

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
