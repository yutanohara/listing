class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  #
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   # strong parametersを設定し、user_idを許可
  #   devise_parameter_sanitizer.for(:sign_up){|u|
  #     u.permit(:user_id, :password, :password_confirmation)
  #   }
  #   devise_parameter_sanitizer.for(:sign_in){|u|
  #     u.permit(:user_id, :password, :remember_me)
  #   }
  # end
end
