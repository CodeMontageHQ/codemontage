class RegistrationsController < Devise::RegistrationsController
  before_filter :setup_services, :only => [:edit, :update]

  def after_sign_up_path_for(resource)
    dashboard_path
  end
  
  protected

  def setup_services
    @services = current_user.services.all
  end
  
end
