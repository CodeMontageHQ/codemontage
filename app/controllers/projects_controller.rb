class ProjectsController < ApplicationController

  def index
    @featured_projects = Project.featured
    @featured_technologies = @featured_projects.technology_counts.order("count DESC")
  end

  def show
    @project = Project.find(params[:id])
    @related_projects = @project.related_projects.featured
  end
end
