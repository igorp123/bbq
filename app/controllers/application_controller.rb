class ApplicationController < ActionController::Base
  before_action :configure_permitted_parametrs, if: :devise_controller?

  def configure_permitted_parametrs
    devise_parameter_sanitizer.for(:account_apdate) { |u|
      u.permit(:password, :passsword_confirmation, :current_password)
    }
  end
end
