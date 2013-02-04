class AddImageUrlToOrganization < ActiveRecord::Migration
  def up
    add_column :organizations, :image_url, :string
  end

  def down
    remove_column :organizations, :image_url
  end
end
