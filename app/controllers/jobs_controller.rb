class JobsController < ApplicationController

  def index
    @active_jobs = Job.active.with_organization
    @hiring_orgs = Organization.hiring
  end
end
