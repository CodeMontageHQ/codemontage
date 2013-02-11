class OrganizationsController < ApplicationController

  def index
    @featured_orgs = Organization.where(Project.where("organization_id = organizations.id").exists).order("name")
  end
  
  def show
    @organization = Organization.find_by_id(params[:id])
    @projects = @organization.projects
  end
end
