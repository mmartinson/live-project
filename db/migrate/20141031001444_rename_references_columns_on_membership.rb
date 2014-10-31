class RenameReferencesColumnsOnMembership < ActiveRecord::Migration
  def change
    rename_column :memberships, :user_id_id, :user_id
    rename_column :memberships, :project_id_id, :project_id
  end
end
