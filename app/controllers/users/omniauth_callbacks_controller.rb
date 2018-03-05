class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
      generic_callback('google')
  end

  def generic_callback( provider )
    @user = User.from_omniauth(request.env["omniauth.auth"])
    #user = User.find_by_email(@user.email)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      puts @user.errors.full_messages
      session["devise.#{provider}_data"] = ENV["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
