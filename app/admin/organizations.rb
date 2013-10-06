ActiveAdmin.register Organization do
  form do |f|
    f.inputs "Organization Details", :multipart => true do
      f.input :name
      f.input :url
      f.input :github_org
      f.input :description
      f.input :is_tax_exempt
      f.input :contact_name
      f.input :contact_role
      f.input :contact_email
      f.input :annual_budget_usd
      f.input :total_staff_size
      f.input :tech_staff_size
      f.input :image_url
      f.input :logo, :as => :file, :hint => f.template.image_tag(f.object.logo.url(:medium))
      f.input :twitter
      f.input :notes
    end

    f.inputs "Impact Metrics" do
      f.semantic_fields_for :organization_metrics do |m|
        m.inputs :metric_value, :metric_label, :metric_footnote
      end
    end

    f.buttons
  end

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
      row "Logo" do image_tag(organization.logo.url(:thumb)) end
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
