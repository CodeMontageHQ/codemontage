class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :organization, :null => false
      t.string :name, :null => false
      t.string :github_repo
      t.string :description
      t.text :notes
      
      t.timestamps
    end
  end
end
