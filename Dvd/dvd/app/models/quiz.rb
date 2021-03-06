class Quiz < ActiveRecord::Base
	belongs_to :user

  has_many :questions_quizzes
  has_many :questions, through: :questions_quizzes
  
  serialize :themes
  serialize :levels

  has_many :proposals

end