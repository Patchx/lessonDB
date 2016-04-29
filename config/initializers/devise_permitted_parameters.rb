module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
  	# Changed this to account for deprecation in ".for"
	  	# Old:
				# devise_parameter_sanitizer.for(:sign_up) << :subscribe_newsletter
	  	# New:
				# devise_parameter_sanitizer.permit(:sign_up, keys: [:subscribe_newsletter])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end

DeviseController.send :include, DevisePermittedParameters
