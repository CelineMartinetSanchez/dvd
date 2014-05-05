class Proposal < ActiveRecord::Base
	belongs_to :question
	belongs_to :questions_quiz
	belongs_to :answer

	def valid?
	  answer.true_false	  
	end

end
