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

def notes_by_downloads(title)
    @full_notes = Note.where(:title => title)
    @notes = @full_notes.where(:verified => '1')
    @notes_count = @notes.size
end

  helper_method :current_user

  def current_basket
  if session[:basket_id]
    @current_basket ||= Basket.find(session[:basket_id])
    #session[:basket_id] = nil if @current_basket.purchased_at
  end
  if session[:basket_id].nil?
    @current_basket = Basket.create!
    session[:basket_id] = @current_basket.id
  end
  @current_basket
  end

  helper_method :current_basket

end
