ActiveAdmin.register Project do
  index do
    column "Organization", :sortable => :organization_name do |proj|
      link_to proj.organization.name, admin_organization_path(proj.organization)
    end
    
    column :name
    column :github_repo
    column :description
    column :cause_list
    column :technology_list
    column :notes
    column :created_at
    column :updated_at
    
    default_actions
  end
  
  form do |f|
    f.inputs "Project Details", :multipart => true do    
      f.input :name
      f.input :github_repo
      f.input :description
      f.input :cause_list
      f.input :technology_list
      f.input :notes
    end
    
    f.buttons
  end
  
  show do |ad|
    attributes_table do
      row :name
      row :github_repo
      row :description
      row :cause_list
      row :technology_list
      row :notes
      row :created_at
      row :updated_at
    end
    
    active_admin_comments
  end
end
