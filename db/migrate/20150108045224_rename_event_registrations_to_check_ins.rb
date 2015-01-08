class RenameEventRegistrationsToCheckIns < ActiveRecord::Migration
  def change
    rename_table :event_registrations, :check_ins
  end
end
