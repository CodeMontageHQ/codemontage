class CreateOrganizationMetrics < ActiveRecord::Migration
  def change
    create_table :organization_metrics do |t|
      t.references :organization, :null => false
      t.string :metric_value, :null => false
      t.string :metric_label, :null => false
      t.text :metric_footnote

      t.timestamps
    end
  end
end
