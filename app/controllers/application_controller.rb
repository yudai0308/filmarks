class ApplicationController < ActionController::Base
	require "devise"
  protect_from_forgery with: :exception
end
