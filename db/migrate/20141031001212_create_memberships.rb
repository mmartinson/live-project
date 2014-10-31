class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :project_id
      t.references :user_id

      t.timestamps
    end
  end
end
