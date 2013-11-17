class JobsController < ApplicationController

  def index
    @active_jobs = Job.active
    @hiring_orgs = Organization.hiring
  end
end
