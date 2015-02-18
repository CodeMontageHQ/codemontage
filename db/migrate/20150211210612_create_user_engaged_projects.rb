class CreateUserEngagedProjects < ActiveRecord::Migration
  def change
    create_table :user_engaged_projects do |t|
      t.string :project_github_url,     null: false
      t.string :engagement_type,        null: false
      t.datetime :github_created_at,    null: false
      t.references :user,               null: false
      t.timestamps
    end

    add_index :user_engaged_projects, :user_id
    add_index :user_engaged_projects, :project_github_url
  end
end
