class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.boolean :true_false
    	t.string :title
      t.references :question

      t.timestamps
    end
  end
end
