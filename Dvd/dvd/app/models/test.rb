class Test < ActiveRecord::Base
	belongs_to :user
	has_many :quizzes

	def score
	  # return the score the user has obtain
	end

	delegate :question, to: :quiz
end
