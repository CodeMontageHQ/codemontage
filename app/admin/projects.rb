ActiveAdmin.register Project do
  index do
    column "Organization", :sortable => :organization_name do |proj|
      link_to proj.organization.name, admin_organization_path(proj.organization)
    end
    
    column :name
    column :github_repo
    column :description
    column "Causes", :cause_list
    column "Technologies", :technology_list
    column :notes
    column "Active?", :is_active
    column :created_at
    column :updated_at
    
    default_actions
  end
  
  form do |f|
    f.inputs "Project Details", :multipart => true do    
      f.input :organization
      f.input :name
      f.input :github_repo
      f.input :description
      f.input :cause_list, :label => "Causes"
      f.input :technology_list, :label => "Technologies"
      f.input :notes
      f.input :is_active, :label => "Active?"
    end
    
    f.buttons
  end
  
  show do |ad|
    attributes_table do
      row :organization
      row :name
      row :github_repo
      row :description
      row "Causes" do ad.cause_list end
      row "Technologies" do ad.technology_list end
      row :notes
      row "Active?" do ad.is_active end
      row :created_at
      row :updated_at
    end
    
    active_admin_comments
  end
end
