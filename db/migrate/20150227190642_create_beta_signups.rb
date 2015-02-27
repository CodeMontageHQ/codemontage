class CreateBetaSignups < ActiveRecord::Migration
  def change
    create_table :beta_signups do |t|
      t.references :user
      t.timestamps
    end

    add_index :beta_signups, :user_id
  end
end
