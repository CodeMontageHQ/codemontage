ActiveAdmin.register Tag do
  index do
    column :name do |tag|
      link_to tag.name, admin_tag_path(tag)
    end
  end
end
