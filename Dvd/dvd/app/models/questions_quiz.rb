class QuestionsQuiz < ActiveRecord::Base
	belongs_to :quiz
	belongs_to :question
	self.primary_key = [:quiz_id, :question_id]

	validates_uniqueness_of :quiz_id, :scope=>:question_id

	before_save do
	  if self.position.blank?
	    last = QuestionsQuiz.find(:first, :conditions=>["question_id = ?", self.question.id], :order=>"position DESC")
	    self.position = (last.blank? ? 0 : (last.position + 1))
	  end
	end
	
	def next
	  QuestionsQuiz.first(:conditions=>["question_id = ? AND position > ?", self.question_id, self.position], :order=>"position")
	end
	
	def previous
	  QuestionsQuiz.last(:conditions=>["question_id = ? AND position < ?", self.question_id, self.position], :order=>"position")
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