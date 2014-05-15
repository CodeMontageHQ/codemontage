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
      f.input :chat_url
      f.input :map_url
      f.input :schedule_url
      f.input :hashtag
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
      row :chat_url do link_to ad.chat_url, ad.chat_url unless !ad.chat_url.present? end
      row :map_url do link_to ad.map_url, ad.map_url unless !ad.map_url.present? end
      row :schedule_url do link_to ad.schedule_url, ad.schedule_url unless !ad.schedule_url.present? end
      row :hashtag
      row :notes
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
