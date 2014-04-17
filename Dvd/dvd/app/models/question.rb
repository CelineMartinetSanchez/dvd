class Question < ActiveRecord::Base
	has_many :questions_quizzes
	has_many :quizzes, :through => :questions_quizzes
	has_many :answers

	has_many :proposals

	has_many :tests

	#acts_as_taggable # Alias for acts_as_taggable_on :tags
	acts_as_taggable_on :theme
	acts_as_taggable_on :level
	scope :by_join_date, order("created_at DESC")

	accepts_nested_attributes_for :quizzes

	def qcm?
	  # return if the question is a qcm (it has proposals), or an open question (it has solutions)
	end

	def next(quizz, question_id)
		# index = quizz.questions.map.with_index{|question, index| index}
		# array = index.zip(0..(quizz.questions.count))
		# current_position = array[question_id]


		# current_question = quizz.questions.find(question_id)

		# quizz.questions.each_with_index do |question, index|
		# 	current_question.index += 1
		# end
		
	end

end


# range = 1..5
# store = 0

# range.each_with_index do |value, i|
#   next_value = range.to_a[i+1].nil? ? 0 : range.to_a[i+1]
#   store += value + next_value
# end