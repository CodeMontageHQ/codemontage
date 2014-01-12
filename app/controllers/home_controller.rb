class HomeController < ApplicationController

  before_filter :login_required, :only => [:coder_day_dashboard, :dashboard]

  def dashboard
    @favorite_projects = current_user.favorites
  end

  def coder_day 
    @sponsors = Organization.sponsors
  end

  def coder_day_dashboard
  end

end
