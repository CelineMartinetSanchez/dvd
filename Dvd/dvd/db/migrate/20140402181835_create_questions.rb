class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :query
      t.string :explanation
      t.string :levels
      t.string :themes

      t.timestamps
    end
  end
end
