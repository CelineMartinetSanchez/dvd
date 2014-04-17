class RemoveColumnFromTests < ActiveRecord::Migration
  def change
  	remove_column :tests, :quiz_id
  end
end
