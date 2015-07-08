module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    ## To permit attributes while registration i.e. sign up 
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    ## To permit attributes while editing a registration 
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end

end

DeviseController.send :include, DevisePermittedParameters