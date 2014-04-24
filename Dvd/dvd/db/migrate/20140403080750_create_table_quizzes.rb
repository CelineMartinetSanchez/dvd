class CreateTableQuizzes < ActiveRecord::Migration
  def change
  	create_table :quizzes do |t|
  		t.references :user
  		t.string :levels
  		t.string :themes
  	  t.timestamps
  	end
  end
end
