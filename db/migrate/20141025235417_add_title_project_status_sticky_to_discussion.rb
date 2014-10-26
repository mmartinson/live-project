class AddTitleProjectStatusStickyToDiscussion < ActiveRecord::Migration
  def change
    add_reference :discussions, :project, index: true
    add_column :discussions, :status, :string
    add_column :discussions, :sticky, :boolean
  end
end
