class Quiz < ActiveRecord::Base
	belongs_to :test
  has_many :questions_quizzes
  has_many :questions, through: :questions_quizzes

  serialize :themes
  serialize :levels


  def question(position)
  	# params[:id]
  end

end