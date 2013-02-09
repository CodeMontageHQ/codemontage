class AddEmailSettingsToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :email_news, :boolean, :null => false, :default => true
    add_column :user_profiles, :email_training, :boolean, :null => false, :default => true    
  end
end
