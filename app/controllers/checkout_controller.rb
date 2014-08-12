class CheckoutController < ApplicationController

	def new
		@basket = Basket.where(:cart_id => @current_cart.id)
	end

end
