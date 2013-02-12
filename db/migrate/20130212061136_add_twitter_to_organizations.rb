class AddTwitterToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :twitter, :string, :limit => 15
  end
end
