class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# Returns if user is an admin
  helper_method :admin?
	def admin?
	  return false unless user_signed_in?
	  if (current_user.email == 'robert.anderson.fl@gmail.com')
	  	return true
	  else
	  	return false
	  end
	end	

	# Returns if user is authorized for this view / action
  helper_method :authorized?
	def authorized?(input)
	  return false unless user_signed_in?
	  return true if admin?

	  if input.class == Lesson
		  return input.user_id == current_user.id
		end

		if input.class == User
		  return input.id == current_user.id
		end

		# If nothing else returns, default return is false
		return false
	end	

end
