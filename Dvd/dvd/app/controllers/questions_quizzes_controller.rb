class QuestionsQuizzesController < ApplicationController

	before_action :set_questions_quiz

# PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @questions_quiz.update(questions_quiz_params)
        format.html { redirect_to @questions_quiz, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
        format.js { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @questions_quiz.errors, status: :unprocessable_entity }
        format.js { head :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def questions_quiz_params
    if params[:questions_quiz] and params[:questions_quiz][:proposals_attributes]
      params[:questions_quiz][:proposals_attributes].each do |idx, attrs|
        attrs.merge!({
          question_id: @questions_quiz.question.id,
          questions_quiz_id: @questions_quiz.id
        })
      end
    end

    params.require(:questions_quiz).permit(proposals_attributes: [:answer_id, :question_id, :questions_quiz_id])
  end


  def set_questions_quiz
    @questions_quiz = QuestionsQuiz.find(params[:id])
  end

end