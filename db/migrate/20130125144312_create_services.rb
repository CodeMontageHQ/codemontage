class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id, :null => false
      t.string :provider, :null => false 
      t.string :uid, :null => false
      t.string :uname
      t.string :uemail

      t.timestamps
    end
  end
end
