class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_filter :current_cart, :items_in_cart, :build_search, :prepare_for_mobile, :prepare_for_tablet

def confirm_logged_in
  unless cookies[:auth_token]
    flash[:notice] = "Please log in"
    redirect_to :root
    return false
  else
    return true
    end
end

def build_search

  @search = Note.search(params[:q])
 
end


  private

def mobile_device?
  if session[:mobile_param]
    session[:mobile_param] == "1"
  else
   request.user_agent =~ /iPhone|Blackberry|Symbian|Android/ 
  end
end

def tablet_device?
  if session[:tablet_param]
    session[:tablet_param] == "1"
  else
    request.user_agent =~ /iPad/
  end
end

helper_method :mobile_device?

def prepare_for_mobile
  session[:mobile_param] = params[:mobile]
  request.format = :mobile if mobile_device?
end

def prepare_for_tablet
  session[:tablet_param] = params[:tablet]
  request.format = :tablet if tablet_device?
end

def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
end

def notes_by_downloads(title)
    @full_notes = Note.where(:title => title)
    @notes = @full_notes.where(:verified => '1')
    @notes_count = @notes.size
end


def current_cart
  if session[:cart_id]
    @current_cart = Cart.find(session[:cart_id])
    if @current_cart.purchased_at
       session[:cart_id] = nil
  end
  end 
  
  if session[:cart_id].nil?
    @current_cart = Cart.create!
    session[:cart_id] = @current_cart.id
  end
  #@current_cart
end

def items_in_cart
  current_cart
  @items = Basket.where(:cart_id => @current_cart.id)
  @current_basket_count = @items.size
  @current_basket_total = @items.sum(:note_price)
end

helper_method :current_user
helper_method :current_basket
helper_method :items_in_cart


end
