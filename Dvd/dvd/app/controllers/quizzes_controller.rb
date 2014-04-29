class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :quiz_proposals_params

  def index
    @quizzes = current_user.quizzes
    @questions = Question.all
  end

  def show
    proposals = @quiz.proposals
    @score = score(proposals)
  end

  def new
    @quiz = Quiz.new
    @question = Question.new
    @all_themes = get_themes
    @all_levels = get_levels

  end

  def edit
  end

  def create
    
    # Fetching themes and levels
    asked_themes = params[:quiz][:question][:theme_list].reject { |c| c.empty? }
    asked_levels = params[:quiz][:question][:level_list].reject { |c| c.empty? }  

    # Sorting questions
    @questions = Question.tagged_with(asked_themes, on: :theme, any: true).tagged_with(asked_levels, on: :level, any: true)
    
    @quiz = current_user.quizzes.build(themes: asked_themes, levels: asked_levels, questions: @questions)

    respond_to do |format|
      if @quiz.save

        format.html { redirect_to quiz_question_path(quiz_id:@quiz.id, id:@questions.first.id), notice: 'Quiz was successfully created.' }
        format.json { render action: 'show', status: :created, location: @questions }
      else
        format.html { render action: 'new' }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url }
      format.json { head :no_content }
    end
  end

  private

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:question_attributes)
    end

    def get_themes
      Question.theme_counts
    end

    def get_levels
      Question.level_counts
    end

    def score(proposals)
      score = 0
      proposals.each do |p|
        if p.valid?
           score +=1
        end
      end
      return score
    end

    # Users can only update proposal attributes
    def quiz_proposals_params
      params.require(:quiz).permit(question_attributes:[:proposals_attributes])
    end

end
