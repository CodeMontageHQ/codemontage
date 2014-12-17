ActiveAdmin.register EventRegistration do
  index do
    column 'Event', sortable: :event_name do |registration|
      link_to registration.event.name, admin_event_path(registration.event)
    end
    column 'User', sortable: :user_name do |registration|
      link_to registration.user.name, admin_user_path(registration.user)
    end
    column :created_at
    column :updated_at

    default_actions
  end

  filter :event_id
  filter :user_id, label: 'User ID', as: :numeric
  filter :created_at
  filter :updated_at
end
