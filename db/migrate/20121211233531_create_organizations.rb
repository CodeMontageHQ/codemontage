class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, :null => false
      t.string :url
      t.string :github_org
      t.text :description
      t.boolean :is_tax_exempt, :null => false, :default => false
      t.string :contact_name
      t.string :contact_role
      t.string :contact_email
      t.integer :annual_budget_usd
      t.integer :total_staff_size
      t.integer :tech_staff_size
      t.text :notes

      t.timestamps
    end
  end
end
