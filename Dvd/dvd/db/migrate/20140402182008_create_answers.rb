class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :good_answer
      t.string :bad_answer
      t.string :bad_answer_2
      t.references :test
      t.references :question

      t.timestamps
    end
  end
end
