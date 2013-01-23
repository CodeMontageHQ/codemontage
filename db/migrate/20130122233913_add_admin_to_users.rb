class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, :null => false, :default => false
  end
end
