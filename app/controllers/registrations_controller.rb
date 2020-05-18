class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, :only => [:create, :update]

    protected def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name) }
    end

end
