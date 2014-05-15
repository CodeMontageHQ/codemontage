class AddEventIdToSponsorships < ActiveRecord::Migration
  def change
    add_column :sponsorships, :event_id, :integer, :null => false, :default => '1'
    remove_column :sponsorships, :event
  end
end
