class CreateFeaturedProjects < ActiveRecord::Migration
  def change
    create_table :featured_projects do |t|
      t.references :project, null: false
      t.references :event, null: false

      t.timestamps
    end

    add_index :featured_projects, :event_id
    add_index :featured_projects, :project_id
  end
end
