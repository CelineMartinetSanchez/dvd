class QuestionsQuiz < ActiveRecord::Base
	belongs_to :quiz
	belongs_to :question
	# acts_as_list :scope => :question_quiz_id
	# self.primary_key = [:quiz_id, :question_id]

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


   # belongs_to :video
   # belongs_to :packvideo
   
   # validates_uniqueness_of :video_id, :scope=>:packvideo_id
   
   # before_save do
   #   if self.position.blank?
   #     last = Packvideojoin.find(:first, :conditions=>["packvideo_id = ?", self.packvideo.id], :order=>"position DESC")
   #     self.position = (last.blank? ? 0 : (last.position + 1))
   #   end
   # end
   
   # def next
   #   Packvideojoin.first(:conditions=>["packvideo_id = ? AND position > ?", self.packvideo_id, self.position], :order=>"position")
   # end
   
   # def previous
   #   Packvideojoin.last(:conditions=>["packvideo_id = ? AND position < ?", self.packvideo_id, self.position], :order=>"position")
   # end