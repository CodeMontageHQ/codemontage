class CreateActiveAdminComments < ActiveRecord::Migration
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.string :resource_id, :null => false
      t.string :resource_type, :null => false
      t.integer :author_user_id # references user_id
      t.text :body
      t.timestamps
    end
    
    add_index :active_admin_comments, [:namespace]
    add_index :active_admin_comments, [:resource_type, :resource_id]
    add_index :active_admin_comments, [:author_user_id]
  end

  def self.down
    drop_table :active_admin_comments
  end
end
