class PaymentNotificationsController < ApplicationController

	protect_from_forgery :except => [:create]

	def create
		PaymentNotification.create!(:p_params => params[:all], :cart_id => params[:invoice], :status => params[:payment_status],:transaction => params[:txn_id] )
		if params[:payment_status] == "Completed"
			@notifying_basket = Basket.find_by(:order_number => params[:invoice])
			@notifying_cart = Cart.find_by(:id => @notifying_basket.cart_id)
			@notifying_cart.update(:purchased_at => Time.now)
		
	end
		render :nothing => true
	end

	def show
		#PaymentNotification.create!(:p_params => params[:all], :cart_id => params[:invoice], :status => params[:payment_status],:transaction => params[:txn_id] )
		#render :nothing => true
	end
end
