class AddUniqueIndexForFavoriteProject < ActiveRecord::Migration
  def change
    add_index :favorite_projects, [:user_id, :project_id], :unique => true
  end
end
