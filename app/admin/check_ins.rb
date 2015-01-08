ActiveAdmin.register CheckIn do
  menu parent: "Event"

  index do
    column "Event", sortable: :event_name do |check_in|
      link_to check_in.event.name, admin_event_path(check_in.event)
    end
    column "User", sortable: :user_name do |check_in|
      link_to check_in.user.name, admin_user_path(check_in.user)
    end
    column :created_at
    column :updated_at

    default_actions
  end

  filter :event_id
  filter :user_id, label: "User ID", as: :numeric
  filter :created_at
  filter :updated_at
end
