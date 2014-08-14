class Basket < ActiveRecord::Base


	attr_accessible :cart_id, :note_id, :buyer_email, :note_title, :note_uploader, :note_category, :note_price, :note_field, :order_number, :secure_string, :downloaded
	#has_many :notes
	before_save { generate_token(:order_number) }


def add_to_basket(note_id)
	
	Basket.create(:cart_id => @current_cart.id, :note_id => note_id)
	save
end


def generate_token(column)
  begin
    self[column] = SecureRandom.hex(8)
  end while Basket.exists?(column => self[column])
end

def send_order_details
	BasketMailer.order_complete(self).deliver

end

def paypal_url(return_url, cart_id, notify_url)
	values ={
		:business => 'jackopaget-facilitator@gmail.com',
		:cmd => '_cart',
		:upload => '1',
		:return => return_url,
		:invoice => order_number,
		:notify_url => notify_url,
		:cert_id => "UXQU95GBYQXTE"
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
	encrypt_for_paypal(values)
end

PAYPAL_CERT_PEM = File.read("#{Rails.root}/cert/paypal_cert.pem")
APP_CERT_PEM = File.read("#{Rails.root}/cert/app_cert.pem")
APP_KEY_PEM = File.read("#{Rails.root}/cert/app_key.pem")

def encrypt_for_paypal(values)
  signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
  OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
end

def purchased_url(cart_b)
	
		basket_items.each_with_index do |item, index|
			values.merge!({
			"id_#{index+1}" => item.note_id
			})
		end

		url = "https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.map{ |k,v| "#{k}=#{v}" }.join("&")
end

end
