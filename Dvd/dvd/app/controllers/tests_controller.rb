class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @score = @test.score
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.tests.build(test_params)
    @quiz = Quiz.new

    respond_to do |format|
      if @test.save
        format.html { redirect_to new_test_quiz_url(@test, @quiz), notice: 'Test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test }
      else
        format.html { render action: 'new' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end

  def display_question
    @question = Test.find(params[:id]).question(params[:position])
  end

  def answer_question
    @test = Test.find(params[:id])
    @question = @test.question(params[:position])
    @answer = Answer.new(:test => @test, :question => @question, :answer => params[:answer])

    if @answer.save
      redirect_to display_question_path(:position => params[:position] + 1)
    else
      # erreur
    end
  end

  private
    
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params[:test]
    end

    def set_user
      @user = current_user
    end
end
