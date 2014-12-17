ActiveAdmin.register Sponsorship do
  index do
    column 'Organization', sortable: :organization_name do |job|
      link_to job.organization.name, admin_organization_path(job.organization)
    end

    column 'Event', sortable: :event_name do |sponsorship|
      link_to sponsorship.event.name, admin_event_path(sponsorship.event)
    end
    column :tier
    column :created_at
    column :updated_at

    default_actions
  end
end
