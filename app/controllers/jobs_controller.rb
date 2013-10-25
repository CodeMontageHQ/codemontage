class JobsController < ApplicationController

  def index
    @active_jobs = Job.active
  end
end
