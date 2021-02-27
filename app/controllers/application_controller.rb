# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :email, :password, :password_confirmation , :role, :phone_number, address: [:address_line, :street, :landmark, :city, :state, :pin_code] ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :email, :password, :password_confirmation, :current_password, :role, :phone_number, address: [:address_line, :street, :landmark, :city, :state, :pin_code] ])
  end
end
