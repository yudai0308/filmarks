class ApplicationController < ActionController::Base
	require "devise"
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:Filmarks_ID, :nickname])
    end
end
