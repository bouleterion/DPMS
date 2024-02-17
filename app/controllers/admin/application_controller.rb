module Admin
    class ApplicationController < ::ApplicationController
      before_action :check_admin
  
      private
  
      def check_admin
        unless current_user&.admin?
          flash[:alert] = "You are not authorized to access this section."
          redirect_to main_app.root_path
        end
      end
    end
  end
  