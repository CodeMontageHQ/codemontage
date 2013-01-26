class RegistrationsController < Devise::RegistrationsController
  before_filter :setup_services, :only => [:edit, :update]
  
  protected

  def setup_services
    @services = current_user.services.all
  end
  
end
