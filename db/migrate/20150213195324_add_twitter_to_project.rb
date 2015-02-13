class AddTwitterToProject < ActiveRecord::Migration
  def change
    add_column :projects, :twitter, :string, limit: 15
  end
end
