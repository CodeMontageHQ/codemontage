class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
		@organization.projects.build
		@project = Project.new(params[:projects])
	end

  def index
    @featured_orgs = Organization.featured
  end
  
  def show
    @organization = Organization.find(params[:id])
    @jobs = @organization.jobs.active
    @projects = @organization.projects.featured
  end
end
