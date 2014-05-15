class AddResourcesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :chat_url, :string
    add_column :events, :map_url, :string
    add_column :events, :schedule_url, :string
    add_column :events, :hashtag, :string    
  end
end
