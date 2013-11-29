class AddLocationToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :location, :string
    add_column :jobs, :latitude, :float
    add_column :jobs, :longitude, :float
  end
end
