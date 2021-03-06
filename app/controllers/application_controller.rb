class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource)
    '/' # サインアウト後のリダイレクト先URL
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :profession, :sex, :birth_day, :office_name])
  end

end
