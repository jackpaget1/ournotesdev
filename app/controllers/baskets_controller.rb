class BasketsController < ApplicationController

	def index
		session[:came_from] = request.env['HTTP_REFERER']
		@notes_needed = Basket.where(:cart_id => @current_cart.id)
		@total_price = @notes_needed.sum(:note_price)
	end

	def new

		session[:return_to] ||= request.referer
		@note_id = params[:note_id]
		# Stop people adding the same item twice to their baskets
		test = Basket.where(:cart_id => @current_cart.id, :note_id => @note_id).first
	if test
			redirect_to :back
	else
		@note_needed = Note.find_by_id(@note_id)
		@note_needed_uploader = @note_needed.uploader
		@note_needed_price = @note_needed.price
		@note_needed_category = @note_needed.cat
		@note_needed_field = @note_needed.fie
		if current_user
		 	Basket.create(:buyer_email => current_user.email, :cart_id => @current_cart.id, :note_id => @note_id, :note_title => @note_needed.title, :note_uploader => @note_needed.uploader, :note_category => @note_needed.cat, :note_price => @note_needed.price, :note_field => @note_needed.fie)
		else

		Basket.create(:cart_id => @current_cart.id, :note_id => @note_id, :note_title => @note_needed.title, :note_uploader => @note_needed.uploader, :note_category => @note_needed.cat, :note_price => @note_needed.price, :note_field => @note_needed.fie)

	end 
		if session[:return_to]
			redirect_to session.delete(:return_to)
		else 
			redirect_to root_url
		end
	end
	end

	def show 
		@basket = Basket.where(:cart_id => @current_cart.id).first
	end

	def update
		@basket = Basket.where(:cart_id => @current_cart.id).first

		if @basket.update_attributes(params[:basket])
			@basket.update_attributes(:order_number => @order_number)
			redirect_to '/baskets/final/checkout'
		else 
			redirect_to 
		end
	end

	def final_checkout
		@basket = Basket.where(:cart_id => @current_cart.id).first
		@notes_needed = Basket.where(:cart_id => @current_cart.id)
		@total_price = @notes_needed.sum(:note_price)
		random_string = SecureRandom.hex(12)
	end

	def remove
		basket_id = params[:id]
		@basket = Basket.find_by_id(basket_id)
		@basket.destroy
		redirect_to '/basket/'
	end

end
