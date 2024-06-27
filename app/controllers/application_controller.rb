class ApplicationController < ActionController::Base
    include SessionsHelper

    private

    def authenticate_user!
        unless logged_in?
          flash[:alert] = "ログインしてくださいね！"
          redirect_to login_url
        end
      end

end
