class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.references :event, :null => false
      t.references :user, :null => false

      t.timestamps
    end

    add_index :event_registrations, :event_id
    add_index :event_registrations, :user_id
  end
end
