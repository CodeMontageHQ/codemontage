ActiveAdmin.register Project do
  index do
    column 'Organization', sortable: :organization_name do |proj|
      link_to proj.organization.name, admin_organization_path(proj.organization)
    end

    column :name
    column :url do |proj|
      link_to proj.url, proj.url, target: 'blank' if proj.url?
    end
    column :github_repo
    column :description
    column :install_url do |proj|
      if proj.install_url?
        link_to proj.install_url, proj.install_url, target: "blank"
      end
    end
    column :help_url do |proj|
      link_to proj.help_url, proj.help_url, target: "blank" if proj.help_url?
    end
    column 'Causes', :cause_list
    column 'Technologies', :technology_list
    column :notes
    column 'Active?', :is_active
    column 'Approved?', :is_approved
    column :created_at
    column :updated_at

    default_actions
  end

  filter :organization
  filter :name
  filter :github_repo
  filter :description
  filter :url
  filter :install_url
  filter :help_url
  filter :notes
  filter :created_at
  filter :updated_at
  filter :is_active
  filter :slug
  filter :is_approved, as: :select
  filter :twitter

  form do |f|
    f.inputs 'Project Details', multipart: true do
      f.input :organization
      f.input :name
      f.input :github_repo
      f.input :url
      f.input :install_url
      f.input :help_url
      f.input :description
      f.input :cause_list, label: 'Causes'
      f.input :technology_list, label: 'Technologies'
      f.input :notes
      f.input :is_active, label: 'Active?'
      f.input :is_approved, label: 'Approved?'
      f.input :twitter, label: "Twitter handle"
    end

    f.buttons
  end

  show do |ad|
    attributes_table do
      row :organization
      row :name
      row :github_repo
      row :url do |proj|
        link_to proj.url, proj.url, target: 'blank' if proj.url?
      end
      row :install_url do |proj|
        if proj.install_url?
          link_to proj.install_url, proj.install_url, target: "blank"
        end
      end
      row :help_url do |proj|
        link_to proj.help_url, proj.help_url, target: "blank" if proj.help_url?
      end
      row :description
      row 'Causes' do ad.cause_list end
      row 'Technologies' do ad.technology_list end
      row :notes
      row 'Active?' do ad.is_active end
      row 'Approved?' do ad.is_approved end
      row :created_at
      row :updated_at
      row :twitter do |proj|
        link_to proj.twitter, "http://twitter.com/" + proj.twitter, target: "blank" if proj.twitter?
      end
    end

    active_admin_comments
  end
end
