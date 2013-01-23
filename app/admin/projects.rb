ActiveAdmin.register Project do
  index do
    column "Organization", :sortable => :organization_name do |proj|
      link_to proj.organization.name, admin_organization_path(proj.organization)
    end
    
    column :name
    column :github_repo
    column :description
    column :notes
    column :created_at
    column :updated_at
  end  
end
