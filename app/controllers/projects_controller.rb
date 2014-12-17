class ProjectsController < ApplicationController
  def index
    @featured_projects =
      if params[:tags].present?
        Project.featured.tagged_with(params[:tags], any: true)
      else
        Project.featured
      end.with_technologies_and_causes.with_organization

    @favorite_projects =
      if current_user.present?
        FavoriteProject.where(user_id: current_user.id).map(&:project_id).to_set
      end
  end

  def show
    @project = Project.find(params[:id])
    @related_projects = @project.related_projects.featured
  end
end
