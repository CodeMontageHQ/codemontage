class ProjectsController < ApplicationController

  def index
    @featured_projects = Project.where("organization_id IS NOT NULL")
  end

  def show
    @project = Project.find_by_id(params[:id])
    @related_projects = @project.related_projects
  end
end
