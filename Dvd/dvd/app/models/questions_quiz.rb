class QuestionsQuiz < ActiveRecord::Base
	belongs_to :quiz
	belongs_to :question

	has_many :proposals
	accepts_nested_attributes_for :proposals, reject_if: proc { |attrs| attrs[:answer_id].to_i == 0 }

	scope :by_quiz, ->(quiz){ where(quiz_id: quiz.id) }


	validates_uniqueness_of :quiz_id, :scope=>:question_id


	# def __class__
	# 	self.class
	# end

	# __method__
	# __FILE__


	before_save do
	  if self.position.blank?
	    last_position = QuestionsQuiz.by_quiz(self.quiz).order(:position).last.try(:position) || -1
	    self.position = last_position + 1

	    # self.position = if cob
	    # 	gtgt
	    # else
	    # 	hyhyh
	    # end

	  end
	end
	
	def next
	  QuestionsQuiz.first(:conditions=>["quiz_id = ? AND position > ?", self.quiz_id, self.position], :order=>"position")
	end
	
	def previous
	  QuestionsQuiz.last(:conditions=>["quiz_id = ? AND position < ?", self.quiz_id, self.position], :order=>"position")
	end





end