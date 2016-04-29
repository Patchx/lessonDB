class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# Returns if user is authorized for this view / action
  helper_method :authorized?
	def authorized?(input=nil)
	  return false unless user_signed_in?
	  return true if current_user.admin

	  if input.nil?
	  	return false
	  end

	  if input.class == Lesson
		  return input.user_id == current_user.id
		elsif input.class == User
		  return input.id == current_user.id
		end

		# If nothing else returns, default return is false
		return false
	end	

end
