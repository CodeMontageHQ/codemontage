ActiveAdmin.register Event do
  index do
    column :id
    column :logo do |event|
      image_tag(event.logo.url(:thumb)) unless !event.logo.exists?
    end
    column :name
    column :short_code
    column :start_date
    column :end_date
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Event Details", :multipart => true do
      f.input :short_code
      f.input :name
      f.input :start_date
      f.input :end_date
      f.input :description
      if f.object.logo.exists?
        f.input :logo, :as => :file, :hint => f.template.image_tag(f.object.logo.url(:thumb))
        f.input :logo_delete, :as => :boolean, :required => :false, :label => "Delete logo?"
      else
        f.input :logo, :as => :file
      end
      f.input :notes
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
      row :description
      row :logo do
        if event.logo.exists?
          image_tag(event.logo.url(:thumb))
        else
          "No image available"
        end
      end
      row :notes
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
