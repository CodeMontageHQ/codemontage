ActiveAdmin.register Organization do
  show do |ad|
    attributes_table do
      row :name
      row :url
      row :github_org
      row :description
      row :is_tax_exempt
      row :contact_name
      row :contact_role
      row :contact_email
      row :annual_budget_usd
      row :total_staff_size
      row :tech_staff_size
      row :image_url
      row :twitter
      row :notes
      row :created_at
      row :updated_at
    end
    
    panel "Impact Metrics" do
      table_for organization.organization_metrics do
        column "Value", :metric_value
        column "Label", :metric_label
        column "Footnote", :metric_footnote
        column :updated_at
      end
    end

    active_admin_comments
  end
end
