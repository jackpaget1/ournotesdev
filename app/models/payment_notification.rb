class PaymentNotification < ActiveRecord::Base

	attr_accessible :p_params, :status, :cart_id
	serialize :p_params
	#after_create :mark_cart_as_purchased

	#def mark_cart_as_purchased
	#	if status == "Completed"
	#		@current_cart.update_attributes(:purchased_at, Time.now)
	#	end
	#end
end
