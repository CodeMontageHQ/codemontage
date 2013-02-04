class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
    @featured_orgs = Organization.where("image_url IS NOT NULL")
  end
  
  def show
    @organization = Organization.find_by_id(params[:id])
    @projects = @organization.projects
  end
end
