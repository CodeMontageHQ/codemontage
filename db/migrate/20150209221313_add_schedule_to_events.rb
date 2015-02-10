class AddScheduleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :schedule, :text
  end
end
