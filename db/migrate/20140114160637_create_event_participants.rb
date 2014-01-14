class CreateEventParticipants < ActiveRecord::Migration
  def change
    create_table :event_participants do |t|
      t.references :event, :null => false
      t.references :user, :null => false

      t.timestamps
    end

    add_index :event_participants, :event_id
    add_index :event_participants, :user_id
  end
end
