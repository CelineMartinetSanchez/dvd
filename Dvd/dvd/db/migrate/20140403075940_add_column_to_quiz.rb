class AddColumnToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :references, :test
  end
end
