class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admins_index_path
    elsif current_user.role == "owner"
      root_path
    elsif current_user.role == "user"
      root_path
    end
  end

  def after_update_path_for(resource)
    letter_opener_web_path(resource)
  end

  def after_sign_up_path_for(resource)
    admin_roles_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :email, :password, :role) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone, :email, :password, :current_password, :role) }
  end
end
