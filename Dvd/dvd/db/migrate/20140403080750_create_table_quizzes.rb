class CreateTableQuizzes < ActiveRecord::Migration
  def change
  	create_table :quizzes do |t|
  		t.references :test
  	  t.timestamps
  	end
  end
end
