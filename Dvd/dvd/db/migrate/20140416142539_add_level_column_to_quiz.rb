class AddLevelColumnToQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :levels, :string
  end
end
