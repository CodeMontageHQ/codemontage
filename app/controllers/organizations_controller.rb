class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
    @project = @organization.projects.new
  end

  def create
    @organization = Organization.find_by_name(params[:organization][:name])
    if @organization
      success = add_project_to_existing_org 
    else
      @organization = Organization.new(params[:organization])
      @organization.is_public_submission = true
      success = @organization.save
    end

    if success
      redirect_to root_path, :notice => "Your project has been submitted for approval."
   	else
	  render :new
    end
  end

  def index
    @featured_orgs = Organization.featured
  end
  
  def show
    @organization = Organization.find(params[:id])
    @jobs = @organization.jobs.active
    @projects = @organization.projects.featured
    @sponsorships = @organization.sponsorships
  end

  private

  def add_project_to_existing_org
    @organization.projects.build(params[:organization][:projects_attributes]["0"])
    @organization.projects.last.save
  end
end
