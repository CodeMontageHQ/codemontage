class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, :null => false
      t.string :name
      t.string :headline
      t.string :gravatar_email
      t.boolean :is_coder, :null => false, :default => false
      t.boolean :represents_org, :null => false, :default => false
      t.boolean :represents_team, :null => false, :default => false

      t.timestamps
    end
    
    add_index :user_profiles, :user_id
  end
end
