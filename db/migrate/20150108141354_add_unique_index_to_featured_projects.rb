class AddUniqueIndexToFeaturedProjects < ActiveRecord::Migration
  def change
    add_index :featured_projects, [:project_id, :event_id], unique: true
  end
end
