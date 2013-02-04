class ProjectsController < ApplicationController

  def show
    @project = Project.find_by_id(params[:id])
    @related_projects = @project.related_projects
  end
end
