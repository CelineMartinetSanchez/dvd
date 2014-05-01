class ScoreController < ApplicationController
	before_action :set_quiz

	def show
		@score = @quiz.score
	end

	def send_score
		@quiz.score = score(@quiz.questions)
		@quiz.save
		
		redirect_to score_path(id:@quiz.id)
	end


	private

	def score(questions)
	  score = 0
	  questions.each do |q|
	    if q.proposals.all? {|p|p.valid}
	       score +=1
	    else
	    	score +=0
	    end
	  end
	  return score
	end

	def set_quiz
		@quiz = Quiz.find(params[:id])
	end

end
