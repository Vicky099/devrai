class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resources)
    admin_dashboards_path
  end

  def after_sign_out_path_for(resources)
    new_user_session_path
  end

  def authenticate_user!
    unless user_signed_in?
      flash[:danger] = "You must login first"
      redirect_to new_user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :date_of_birth, :address, :contact_no, :city, :state, :email, :password])
  end

end
