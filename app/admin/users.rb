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
end
