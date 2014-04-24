class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :chosen_answer
      t.references :question
      t.timestamps
    end
  end
end
