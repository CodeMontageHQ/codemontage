class OrganizationsController < ApplicationController

  def index
    @featured_orgs = Organization.featured
  end
  
  def show
    @organization = Organization.find(params[:id])
    @projects = @organization.projects.featured
  end
end
