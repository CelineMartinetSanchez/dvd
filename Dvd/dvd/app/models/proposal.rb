class Proposal < ActiveRecord::Base
	belongs_to :question
	belongs_to :quiz
	belongs_to :answer

	def valid?
	  if self.answer.true_false == true
	  	return true
	  else
	  	return false
	  end
	end
end
