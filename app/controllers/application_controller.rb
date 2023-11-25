class ApplicationController < ActionController::Base
   before_action :authenticate_user!, unless: :devise_controller?

    private

    def current_group
      @current_group ||= current_user.group if user_signed_in?
    end
    
    helper_method :current_group
end
