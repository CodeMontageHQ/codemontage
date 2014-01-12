class ProjectsController < ApplicationController

  def index
    @featured_projects = Project.featured
    @favorite_projects = FavoriteProject.
      where(:user_id => current_user.id).
      map {|p| p.project_id }.
      to_set
  end

  def show
    @project = Project.find(params[:id])
    @related_projects = @project.related_projects.featured
  end
end
