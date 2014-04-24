class QuestionsController < ApplicationController
  before_action :set_quiz, only: [:show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json

  def quiz_questions
    @questions = set_quiz.questions
  end

  def index
    @questions = Question.all
  end

  def show
    # passe l'id de la question suivante
    @next_question = @question.next(@quiz)

    # @question.proposals.create()
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.answers.build
    @all_themes = get_themes
    @all_levels = get_levels
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.answers.build(params[:question][:answer])

    # Creating associations for themes and levels
    asked_themes = params[:question][:theme_list].reject { |c| c.empty? }
    asked_levels = params[:question][:level_list].reject { |c| c.empty? }
    @question.theme_list.add(asked_themes)
    @question.level_list.add(asked_levels)


    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: questions_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:query, :explanation, answers_attributes:[:id, :title, :true_false, :_destroy])
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def get_themes
      Question.theme_counts
    end

    def get_levels
      Question.level_counts
    end

end
