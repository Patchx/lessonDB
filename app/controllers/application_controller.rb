class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# Returns if user is authorized for this view / action
  helper_method :authorized?
	def authorized?(input)
	  return false unless user_signed_in?
	  return input.user_id == current_user.id
	end	

end
