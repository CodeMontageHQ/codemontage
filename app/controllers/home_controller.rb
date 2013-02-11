class HomeController < ApplicationController

  def dashboard
    redirect_to '/' unless user_signed_in?
    @favorite_projects = current_user.favorites
  end

end
