ActiveAdmin.register FeaturedProject do
  menu parent: 'Events'

  index do
    column :id
    column :event
    column :project
    column :created_at
    column :updated_at
    actions
  end
end
