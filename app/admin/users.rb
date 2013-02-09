ActiveAdmin.register User do
  index do
    column :name
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column "Causes", :cause_list
    column "Technologies", :technology_list
    column "Coder", :is_coder
    column "Organization", :represents_org
    column "Team", :represents_team
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
  end
  
  form do |f|
    f.inputs "User Details", :multipart => true do    
      f.input :name
      f.input :email
      f.input :cause_list, :label => "Causes"
      f.input :technology_list, :label => "Technologies"
      f.input :is_coder, :label => "Is a Coder", :as => :boolean
      f.input :represents_org, :label => "Represents an Organization", :as => :boolean
      f.input :represents_team, :label => "Represents a Team", :as => :boolean
      f.input :gravatar_email
    end

    f.buttons
  end
  
  show do |ad|
    attributes_table do
      row :name
      row :email
      row "Causes" do ad.cause_list end
      row "Technologies" do ad.technology_list end
      row "Coder" do ad.is_coder end
      row "Organization" do ad.represents_org end
      row "Team" do ad.represents_team end
      row :gravatar_email
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
    
    active_admin_comments
  end
end
