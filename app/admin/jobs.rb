ActiveAdmin.register Job do
  index do
    column "Organization", :sortable => :organization_name do |job|
      link_to job.organization.name, admin_organization_path(job.organization)
    end
    
    column :title
    column :overview
    column "Application Link", :sortable => :apply_url do |job|
      link_to job.apply_url, job.apply_url
    end
    column :location
    column "Causes", :cause_list
    column "Technologies", :technology_list
    column "Expires", :expires_at
    column :created_at
    column :updated_at
    
    default_actions
  end

  form do |f|
    f.inputs "Job Post", :multipart => true do    
      f.input :organization
      f.input :title
      f.input :overview
      f.input :apply_url
      f.input :location
      f.input :cause_list, :label => "Causes"
      f.input :technology_list, :label => "Technologies"
      f.input :expires_at, :as => :datepicker, :label => "Expires"
    end
    
    f.buttons
  end

  show do |ad|
    attributes_table do
      row :organization
      row :title
      row :overview
      row :apply_url
      row :location
      row "Causes" do ad.cause_list end
      row "Technologies" do ad.technology_list end
      row "Expires" do ad.expires_at end
      row :created_at
      row :updated_at
    end
    
    active_admin_comments
  end

end
