class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
		@organization.projects.build
	end

	def create
		@organization = Organization.new(params[:organization])

		if @organization.save
			redirect_to root_path, :notice => "Your project has been submitted for approval."
		else
			render :action => "new"
		end
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
