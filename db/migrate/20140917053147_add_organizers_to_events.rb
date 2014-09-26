class AddOrganizersToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lead_organizer, :string
    add_column :events, :lead_email, :string
    add_column :events, :organizer, :string
    add_column :events, :organizer_email, :string
  end
end
