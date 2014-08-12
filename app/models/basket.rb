class Basket < ActiveRecord::Base

	attr_accessible :cart_id, :note_id, :buyer_email, :note_title, :note_uploader, :note_category, :note_price, :note_field, :order_number

	before_save { generate_token(:order_number) }


	def add_to_basket(note_id)

		Basket.create(:cart_id => @current_cart.id, :note_id => note_id)

	end

def generate_token(column)
  begin
    self[column] = SecureRandom.hex(8)
  end while Basket.exists?(column => self[column])
end

def paypal_url(return_url, cart_id, notify_url)
	values ={
		:business => 'jackopaget-facilitator@gmail.com',
		:cmd => '_cart',
		:upload => '1',
		:return => return_url,
		:invoice => order_number,
		:notify_url => notify_url
	}
	basket_items = Basket.where(:cart_id => cart_id)
	basket_items.each_with_index do |item, index|
		values.merge!({
			"amount_#{index+1}" => item.note_price,
			"item_name_#{index+1}" => item.note_title,
			"item_number_#{index+1}" => item.note_id,
			"quantity_#{index+1}" => 1

			})
	end
	"https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.map{ |k,v| "#{k}=#{v}" }.join("&")
end

end
