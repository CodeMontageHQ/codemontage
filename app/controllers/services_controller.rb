# Structure and majority of code inspired by Markus Proske of Ruby on Rails CommunityGuides
# http://communityguides.heroku.com/articles/11

class ServicesController < ApplicationController
  before_filter :authenticate_user!, except: [:create]

  def index
    @services = current_user.services.all
  end

  def destroy
    # remove an authentication service linked to the current user
    @service = current_user.services.find(params[:id])
    @service.destroy

    redirect_to services_path
  end

  def create
    # get the service parameter from the Rails router
    params[:service] ? service_route = params[:service] : service_route = 'no service (invalid callback)'

    # get the full hash from omniauth
    omniauth = request.env['omniauth.auth']

    # continue only if hash and parameter exist
    if omniauth and params[:service]

      # map the returned hashes to our variables first - the hashes differ for every service
      if service_route == 'github'
        omniauth['info']['email'] ? email =  omniauth['info']['email'] : email = ''
        omniauth['info']['name'] ? name =  omniauth['info']['name'] : name = ''
        omniauth['info']['nickname'] ? login =  omniauth['info']['nickname'] : login = ''
        omniauth['extra']['raw_info']['id'] ?  uid =  omniauth['extra']['raw_info']['id'] : uid = ''
        omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
      else
        # we have an unrecognized service, just output the hash that has been returned
        render text: omniauth.to_yaml
        return
      end

      # continue only if provider and uid exist
      if uid != '' and provider != ''

        # nobody can sign in twice, nobody can sign up while being signed in
        if !user_signed_in?

          # check if user has already signed in using this service provider and continue with sign in process if yes
          auth = Service.find_by_provider_and_uid(provider, uid.to_s)
          if auth
            flash[:notice] = 'Signed in successfully via ' + provider.capitalize + '.'
            sign_in_and_redirect(:user, auth.user)
          else
            # check if this user is already registered with this email address; get out if no email has been provided
            if email != ''
              # search for a user with this email address
              existing_user = User.find_by_email(email)
              if existing_user
                # map this new login method via a service provider to an existing account if the email address is the same
                existing_user.services.create(provider: provider, uid: uid, uemail: email, ulogin: login, uname: name)
                flash[:notice] = 'Sign in via ' + provider.capitalize + ' has been added to your account ' + existing_user.email + '. Signed in successfully!'
                sign_in_and_redirect(:user, existing_user)
              else
                # let's create a new user: register this user and add this authentication method for this user

                # new user, set email, a random password and take the name from the authentication service
                user = User.new email: email, password: SecureRandom.hex(10)

                # add this authentication service to our new user
                user.services.build(provider: provider, uid: uid, uemail: email, ulogin: login, uname: name)

                user.save!

                # flash and sign in
                flash[:myinfo] = 'Your account on CodeMontage has been created via ' + provider.capitalize + '. In your account settings, you can change your email address and/or your password.'
                sign_in_and_redirect(:user, user)
              end
            else
              flash[:alert] =  service_route.capitalize + ' cannot be used to sign up on CodeMontage as no valid email address has been provided. Please add a public email address or sign up manually. If you already have an account, you can sign in and add ' + service_route.capitalize + ' from your profile.'
              redirect_to new_user_session_path
            end
          end
        else
          # the user is currently signed in

          # check if this service is already linked to his/her account, if not, add it
          auth = Service.find_by_provider_and_uid(provider, uid.to_s)
          if !auth
            current_user.services.create(provider: provider, uid: uid, uemail: email, ulogin: login, uname: name)
            flash[:notice] = 'Sign in via ' + provider.capitalize + ' has been added to your account.'
            redirect_to services_path
          else
            flash[:notice] = service_route.capitalize + ' is already linked to your account.'
            redirect_to services_path
          end
        end
      else
        flash[:alert] =  service_route.capitalize + ' returned invalid data for the user id.'
        redirect_to new_user_session_path
      end
    else
      flash[:alert] = 'Error while authenticating via ' + service_route.capitalize + '.'
      redirect_to new_user_session_path
    end
  end
end
