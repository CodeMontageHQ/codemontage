class AddInstallUrlAndHelpUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :install_url, :string
    add_column :projects, :help_url, :string
  end
end
