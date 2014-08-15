class BasketMailer < ActionMailer::Base
  default from: "anglysnotes@gmail.com"

  def order_complete(basket)
  		@user = basket
  		@info = Basket.where(:cart_id => @user.cart_id)
  		@total_price = @info.sum(:note_price)
  		verifier = ActiveSupport::MessageVerifier.new('VJ5VX8RIRE')
  		@signed_m = verifier.generate(basket.order_number)
  		mail :to => basket.buyer_email, :subject => "Your Order Number: "+basket.order_number
	end
end
