class HomeController < ApplicationController

  def dashboard
    redirect_to '/' unless user_signed_in?
  end

end
