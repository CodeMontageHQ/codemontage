class AddIsActiveToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_active, :boolean, :null => false, :default => true
  end
end
