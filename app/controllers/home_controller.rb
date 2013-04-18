class HomeController < ApplicationController

  before_filter :login_required, :only => :dashboard

  def dashboard
    @favorite_projects = current_user.favorites
  end

end
