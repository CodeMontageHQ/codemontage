class UserProfilesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @user_profile = current_user.profile
    if @user_profile.update_attributes(params[:user_profile])
      flash[:notice] = 'Successfully updated your profile.'
      redirect_to dashboard_path
    else
      flash[:notice] = 'Oops - no updates were saved.'
      redirect_to edit_user_registration_path
    end
  end
end
