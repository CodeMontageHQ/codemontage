ActiveAdmin.register Job do
  index do
    column "Organization", :sortable => :organization_name do |job|
      link_to job.organization.name, admin_organization_path(job.organization)
    end
    
    column :title
    column :overview
    column "Application Link", :sortable => :apply_url do |job|
      link_to job.apply_url
    end
    column :expires_at
    column :created_at
    column :updated_at
    
    default_actions
  end
end
