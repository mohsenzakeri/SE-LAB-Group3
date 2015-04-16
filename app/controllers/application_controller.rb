# encoding: UTF-8
class ApplicationController < ActionController::Base
    require 'jalali_date'



  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!
  #before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_devise_permitted_parameters, if: :devise_controller? 



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#  protected

 # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :nickname, :birthdate, :email, :password) }
   # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :nickname,  :email, :password , :password_confirmation ,  :current_password) }
    
 # end

#Niloofar Added
  def login_required
    redirect_to(new_session_path(:user)) if current_user.blank?
  end



  protected

  def configure_devise_permitted_parameters
    registration_params = [:firstname, :lastname, :nickname, :birthdate, :email, :password]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
