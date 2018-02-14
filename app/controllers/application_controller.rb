class ApplicationController < ActionController::Base
   #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_trainer,:trainer_signed_in?
  
  def trainer_signed_in?
     !session[:user_id].nil?
  end

  def current_trainer
  	if trainer_signed_in?
     Coach.find(session[:user_id])
    end
  end

  def authenticate_trainer
    unless trainer_signed_in?
    	return redirect_to '/coach/signin'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
