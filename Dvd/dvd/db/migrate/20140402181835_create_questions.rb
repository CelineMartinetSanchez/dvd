class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :query
      t.string :explanation

      t.timestamps
    end
  end
end
