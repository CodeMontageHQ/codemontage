class AddLoginToServices < ActiveRecord::Migration
  def change
    add_column :services, :ulogin, :string
  end
end
