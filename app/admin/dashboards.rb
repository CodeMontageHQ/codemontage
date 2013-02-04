ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  section "Top User Causes", :priority => 1 do
    ul do
      User.tag_counts_on(:causes).last(5).map do |tag|
        li link_to(tag.name + " (" + User.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
      end
    end
  end
  
  section "Top User Technologies", :priority => 1 do
    ul do
      User.tag_counts_on(:technologies).last(5).map do |tag|
        li link_to(tag.name + " (" + User.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
      end
    end
  end
    
  section "New Users", :priority => 2 do
    ul do
      User.last(5).map do |user|
        li link_to(user.email, admin_user_path(user))
      end
    end
  end
  
  section "Top Project Causes", :priority => 3 do
    ul do
      Project.tag_counts_on(:causes).last(5).map do |tag|
        li link_to(tag.name + " (" + Project.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
      end
    end
  end

  section "Top Project Technologies", :priority => 3 do
    ul do
      Project.tag_counts_on(:technologies).last(5).map do |tag|
        li link_to(tag.name + " (" + Project.tagged_with(tag).count.to_s + ")", admin_tag_path(tag))
      end
    end
  end

  section "Recent Projects", :priority => 4 do
    ul do
      Project.last(5).map do |proj|
        li link_to(proj.name, admin_project_path(proj))
      end
    end
  end

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
