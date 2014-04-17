class Proposal < ActiveRecord::Base
	belongs_to :question

	def valid?
	  # return if the answer was correct or not
	end
end
