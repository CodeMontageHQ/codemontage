ActiveAdmin.register Event do
  index do
    column :id
    column :logo do |event|
      image_tag(event.logo.url(:thumb)) if event.logo.exists?
    end
    column :name
    column :short_code
    column :start_date
    column :end_date
    column :created_at
    column :updated_at
    column :lead_organizer
    column :lead_email
    column :organizer
    column :organizer_email
    column :location
    default_actions
  end

  form do |f|
    f.inputs 'Event Details', multipart: true do
      f.input :short_code
      f.input :name
      f.input :lead_organizer
      f.input :lead_email, label: 'Lead organizer email'
      f.input :organizer
      f.input :organizer_email
      f.input :start_date
      f.input :end_date
      f.input :location
      f.input :teaser
      f.input :description
      if f.object.logo.exists?
        f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo.url(:thumb))
        f.input :logo_delete, as: :boolean, required: :false, label: 'Delete logo?'
      else
        f.input :logo, as: :file
      end
      f.input :chat_url
      f.input :map_url
      f.input :schedule_url
      f.input :hashtag
      f.input :eventbrite_url
      f.input :notes
    end

    f.inputs "Featured Projects" do
      f.has_many :featured_projects, sortable: :project do |fp|
        fp.input :project
      end
    end

    f.buttons
  end

  show do |ad|
    attributes_table do
      row :id
      row :short_code
      row :name
      row :start_date
      row :end_date
      row :location
      row :lead_organizer
      row :lead_email
      row :organizer
      row :organizer_email
      row :teaser
      row :description
      row :logo do
        if event.logo.exists?
          image_tag(event.logo.url(:thumb))
        else
          'No image available'
        end
      end
      row :chat_url do link_to ad.chat_url, ad.chat_url if ad.chat_url.present? end
      row :map_url do link_to ad.map_url, ad.map_url if ad.map_url.present? end
      row :schedule_url do link_to ad.schedule_url, ad.schedule_url if ad.schedule_url.present? end
      row :hashtag
      row :eventbrite_url do link_to ad.eventbrite_url, ad.eventbrite_url if ad.eventbrite_url.present? end
      row :notes
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  sidebar "Featured Projects", only: :show do
    table_for event.featured_projects do
      column :project
      column "Actions" do |fp|
        link_to("View", admin_featured_project_path(fp),
                class: "member_link") +
        link_to("Edit", edit_admin_featured_project_path(fp),
                class: "member_link") +
        link_to("Delete", admin_featured_project_path(fp),
                method: :delete, class: "member_link")
      end
    end
  end
end
