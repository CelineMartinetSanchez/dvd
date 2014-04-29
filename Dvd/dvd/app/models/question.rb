class Question < ActiveRecord::Base
	has_many :questions_quizzes
	has_many :quizzes, :through => :questions_quizzes
	has_many :answers, :dependent => :destroy
	accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true

	has_many :proposals
	accepts_nested_attributes_for :proposals, reject_if: proc { |attrs| attrs[:answer_id].to_i == 0 }


	#acts_as_taggable # Alias for acts_as_taggable_on :tags
	acts_as_taggable_on :theme
	acts_as_taggable_on :level
	scope :by_join_date, order("created_at DESC")


	serialize :themes
	serialize :levels

	scope :by_question, ->(question){ where(question_id: question.id) }
	
	def qcm?
	  # return if the question is a qcm (it has proposals), or an open question (it has solutions)
	end

	def next(quiz)

		question_quiz = self.questions_quizzes.by_quiz(quiz).first.try(:next)
		
		if question_quiz.present?
			question_quiz.question
		end

	end

end


# range = 1..5
# store = 0

# range.each_with_index do |value, i|
#   next_value = range.to_a[i+1].nil? ? 0 : range.to_a[i+1]
#   store += value + next_value
# end

# self = Quiz.find(:id)