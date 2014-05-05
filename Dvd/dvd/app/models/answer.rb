class Answer < ActiveRecord::Base
	belongs_to :question
	
	# Not really an "ownership" relationship
	# proposals refer to answers so this is the relation back to proposals
	# referring to an answer
	has_many :proposals
end
