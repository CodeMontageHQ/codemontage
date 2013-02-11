class HomeController < ApplicationController

  def dashboard
    @favorite_projects = current_user.favorites
  end

end
