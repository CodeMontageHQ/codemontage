class AddEventbriteUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventbrite_url, :string
  end
end
