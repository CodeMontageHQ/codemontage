class RenameIndicesOnCheckIns < ActiveRecord::Migration
  def change
    rename_index :check_ins, "index_event_registrations_on_event_id",
                 "index_check_ins_on_event_id"
    rename_index :check_ins, "index_event_registrations_on_user_id",
                 "index_check_ins_on_user_id"
  end
end
