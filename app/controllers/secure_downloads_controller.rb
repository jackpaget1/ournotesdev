class SecureDownloadsController < ApplicationController


	def show
		@notifying_basket = Basket.where(:order_number => params[:id]).first
		if @notifying_basket
		if @notifying_basket.downloaded == 0
		@order_num = params[:id]
		send_file("#{Rails.root}/secured/#{@order_num}.zip", :filename => @order_number, :type=>"application/zip" )
		#FileUtils.rm("#{Rails.root}/secured/#{@order_num}.zip")
		dwl = @notifying_basket.downloaded + 1
		@notifying_basket.update_attributes(:downloaded => dwl)
		else 
		redirect_to root_url
		end
		else
		redirect_to root_url
		end
	end

end

