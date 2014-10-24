class AddProjectIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :question, :resource
  end
end
