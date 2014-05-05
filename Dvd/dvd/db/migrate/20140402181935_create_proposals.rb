class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.references :answer
      t.references :question
      t.references :questions_quiz
      t.timestamps
    end
  end
end
