class AddRecentProjectToUser < ActiveRecord::Migration
  def change
    add_column :users, :recent_project_id, :integer, index: true
    add_index :users, :recent_project_id
  end
end
