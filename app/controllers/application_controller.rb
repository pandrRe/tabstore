class ApplicationController < ActionController::Base
    before_action :auth
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def auth
        redirect_to '/login' unless logged_in?
    end
end
