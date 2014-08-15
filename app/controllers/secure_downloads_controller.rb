class SecureDownloadsController < ApplicationController


	def show
		@notifying_basket = Basket.where(:order_number => params[:id]).first
		@cart = Cart.where(:id => @notifying_basket.cart_id).first
		if @cart.purchased_at
			@notes = Basket.where(:cart_id => @notifying_basket.cart_id, :downloaded => 0)
		else
			@message_token = "Not Purchased"
		end

end

	def new
		val1 = params[:id]
		val2 = params[:type]
		@basket = Basket.where(:order_number => val1, :downloaded => 0).first
		if @basket
		@basket.update_attributes(:downloaded => 1)
		@note = Note.find_by_id(@basket.note_id)
		redirect_to @note.attachment_url
		else
			redirect_to root_url
		end

	end


 

end

