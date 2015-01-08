class AddUniqueIndexToCheckIns < ActiveRecord::Migration
  def change
    add_index :check_ins, [:event_id, :user_id], unique: true
  end
end
