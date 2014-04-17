class ChangeTestTableColumnName < ActiveRecord::Migration
  def change
  	rename_column :tests, :quizz_id, :quiz_id
  end
end
