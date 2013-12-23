class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.references :organization, :null => false
      t.string :event, :null => false
      t.integer :tier, :null => false

      t.timestamps
    end

    add_index :sponsorships, :organization_id
  end
end
