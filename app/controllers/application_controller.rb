class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def confirm_logged_in
    unless cookies[:auth_token]
        flash[:notice] = "Please log in"
        redirect_to :root
        return false
    else
        return true
    end
	end

  private

def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
end

  helper_method :current_user

end
