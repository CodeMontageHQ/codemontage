ActiveAdmin.register User do
  index do
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
  end
  
  form do |f|
    f.inputs "User Details", :multipart => true do    
      f.input :email
      f.input :cause_list
      f.input :technology_list
    end
    
    f.buttons
  end
  
  show do |ad|
    attributes_table do
      row :email
      row :cause_list
      row :technology_list
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
    
    active_admin_comments
  end
end
