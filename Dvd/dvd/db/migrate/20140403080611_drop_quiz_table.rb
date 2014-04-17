class DropQuizTable < ActiveRecord::Migration
  def change
  	drop_table :quizzes
  end
end
