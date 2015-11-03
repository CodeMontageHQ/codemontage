class ChangeBetaSignupsUserIdToBePresent < ActiveRecord::Migration
  def change
    change_column :beta_signups, :user_id, :integer, null: false
  end
end
