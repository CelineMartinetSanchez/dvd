class CreateTableQuestionQuizzes < ActiveRecord::Migration
  def change
    create_table :questions_quizzes do |t|
    	t.belongs_to :quiz
    	t.belongs_to :question
    	t.integer :position
    	t.index [:quiz_id, :question_id]
      # t.index [:question_id, :quiz_id]
    end
  end
end
