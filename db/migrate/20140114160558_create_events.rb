class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :short_code, :null => false
      t.string :name, :null => false
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :description
      t.text :notes
      
      t.timestamps
    end

    add_index :events, :short_code, :unique => true
  end
end
