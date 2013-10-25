class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :organization, :null => false
      t.string :title, :null => false, :limit => 50
      t.text :overview, :limit => 500
      t.string :apply_url
      t.datetime :expires_at

      t.timestamps
    end
    
    add_index :jobs, :organization_id
    add_index :jobs, :expires_at
  end
end
