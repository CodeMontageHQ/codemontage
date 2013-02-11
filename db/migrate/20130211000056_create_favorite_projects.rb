class CreateFavoriteProjects < ActiveRecord::Migration
  def change
    create_table :favorite_projects do |t|
      t.references :project, :null => false
      t.references :user, :null => false
      t.boolean :removed, :null => false, :default => false

      t.timestamps
    end
    
    add_index :favorite_projects, :project_id
    add_index :favorite_projects, :user_id
  end
end
