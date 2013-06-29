class OrganizationsController < ApplicationController

  def index
    @featured_orgs = Organization.featured
  end
  
  def show
    @organization = Organization.find_by_id(params[:id])
    @projects = @organization.projects
  end
end
