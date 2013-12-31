class AddIsApprovedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_approved, :boolean, :null => false, :default => false
  end
end
