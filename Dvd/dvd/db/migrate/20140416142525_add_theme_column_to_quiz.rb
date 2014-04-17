class AddThemeColumnToQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :themes, :string
  end
end
