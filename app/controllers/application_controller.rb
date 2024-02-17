class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    # Before actions can be used to check for authenticated user
    # before_action :authenticate_user!, except: []
  
    private
  
    # Use this method to verify if a user is logged in, for use in views and controllers
    def user_logged_in?
      user_signed_in?
    end
  
    # Use this as a helper method to make it available in views
    helper_method :user_logged_in?
  
    # Example method to check for admin role, assuming your User model has an 'admin?' method
    def authenticate_admin!
      unless current_user&.admin?
        flash[:alert] = "You are not authorized to access this section."
        redirect_to root_path
      end
    end
  
    # Optionally, you can customize the after_sign_in_path_for resource
    def after_sign_in_path_for(resource)
      # Direct user to a specific path based on their role or any other condition
      stored_location_for(resource) || root_path
    end
end
  
  