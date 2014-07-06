class ProjectsController < ApplicationController

  def index
    @featured_projects = 
      if params[:tags].present?
        Project.featured.tagged_with(params[:tags], :any => true) 
      else 
        Project.featured 
      end.includes :technologies, :causes

    @favorite_projects = 
      if current_user.present?
        FavoriteProject.where(:user_id => current_user.id).map {|p| p.project_id }.to_set
      else
      end
  end

  def new
    @project = Project.new
  end

  def create
    @organization = Organization.find_by_name(params[:org_name])
    if @organization
      @organization.projects.build(params[:project])
      if @organization.save
        redirect_to root_path, :notice => "Your project has been submitted for approval."
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @related_projects = @project.related_projects.featured
  end
end
