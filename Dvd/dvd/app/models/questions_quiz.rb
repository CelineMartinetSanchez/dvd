class QuestionsQuiz < ActiveRecord::Base
	belongs_to :quiz
	belongs_to :question
	self.primary_key = [:quiz_id, :question_id]

	acts_as_list scope: :question
end
