class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    @organization.is_public_submission = current_user.is_admin unless current_user.nil?
    @project = @organization.projects.build(params[:projects])
  end

  def create
    @organization = Organization.new(params[:organization])
    @organization.is_public_submission = true

    if @organization.save
      redirect_to root_path, notice: 'Your project has been submitted for approval.'
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
    @projects = @organization.projects.featured.includes :technologies, :causes
    @sponsorships = @organization.sponsorships
  end
end
