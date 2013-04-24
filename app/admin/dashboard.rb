ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do # Summary
        panel "Summary Stats", :priority => 1 do
          para "So far, we're helping: "
          ul do
            li link_to User.count.to_s + " Users", admin_users_path
            li link_to Organization.count.to_s + " Organizations", admin_organizations_path
            li link_to Project.count.to_s + " Projects", admin_projects_path
          end
        end
      end
      
      column do # Users
        panel "New Users", :priority => 2 do
          ul do
            User.last(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end

        panel "Top User Causes", :priority => 2 do
          ul do
            UserProfile.tag_counts_on(:causes).last(5).map do |tag|
              li link_to(tag.name + " (" + UserProfile.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
            end
          end
        end

        panel "Top User Technologies", :priority => 2 do
          ul do
            UserProfile.tag_counts_on(:technologies).last(5).map do |tag|
              li link_to(tag.name + " (" + UserProfile.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
            end
          end
        end

      end
      
      column do # Projects
        panel "Recent Projects", :priority => 4 do
          ul do
            Project.last(5).map do |proj|
              li link_to(proj.name, admin_project_path(proj))
            end
          end
        end

        panel "Top Project Causes", :priority => 3 do
          ul do
            Project.tag_counts_on(:causes).last(5).map do |tag|
              li link_to(tag.name + " (" + Project.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
            end
          end
        end

        panel "Top Project Technologies", :priority => 3 do
          ul do
            Project.tag_counts_on(:technologies).last(5).map do |tag|
              li link_to(tag.name + " (" + Project.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
            end
          end
        end

      end
    end
  end
end
