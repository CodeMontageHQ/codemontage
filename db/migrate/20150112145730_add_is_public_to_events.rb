class AddIsPublicToEvents < ActiveRecord::Migration
  def change
    add_column :events, :is_public, :boolean, null: false, default: false
  end
end
