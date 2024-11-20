class AddTitleToWorkspace < ActiveRecord::Migration[8.0]
  def change
    add_column :workspaces, :title, :string
  end
end
