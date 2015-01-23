class ProjectsController < ApplicationController
  before_filter :current_event, only: :index

  def index
    @featured_projects =
      if params[:tags].present?
        Project.featured.tagged_with(params[:tags], any: true)
      else
        Project.featured
      end.with_technologies_and_causes.with_organization
  end

  def show
    @project = Project.find(params[:id])
    @related_projects = @project.related_projects.featured
  end
end
