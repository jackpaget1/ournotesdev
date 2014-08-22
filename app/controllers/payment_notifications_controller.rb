class PaymentNotificationsController < ApplicationController

	protect_from_forgery :except => [:create]

	def create
		PaymentNotification.create!(:p_params => params[:all], :cart_id => params[:invoice], :status => params[:payment_status],:transaction => params[:txn_id] )
		if params[:payment_status] == "Completed" or params[:payment_status] == "Pending"
			@notifying_basket = Basket.find_by(:order_number => params[:invoice])
			@notifying_cart = Cart.find_by(:id => @notifying_basket.cart_id)
			@notifying_cart.update(:purchased_at => Time.now)
			@buyer_mail = @notifying_basket.buyer_email
			FileUtils.mkdir_p("#{Rails.root}/secured/#{@notifying_basket.order_number}")
			@notes = Basket.where(:cart_id => @notifying_basket.cart_id, :downloaded => 0)
			@notes.each do |note|
				files = Note.where(:id => note.note_id).first
				dwl = files.downloads + 1
				files.update_attributes(:downloads => dwl)
				stamp = "#{Rails.root}/secured/#{@notifying_basket.order_number}/stamp.pdf"
				Prawn::Document.generate(stamp, page_size: 'A4', bottom_margin: 24) do |pdf|
          			pdf.text_box "(c) #{files.uploader} downloaded from www.OurNotes.com on #{Time.now} by #{@buyer_mail} -Not For Distribution -", align: :center, valign: :bottom, size: 7
      			end
      			system("s3cmd get s3://securednotes/#{files.filename} #{Rails.root}/secured/#{@notifying_basket.order_number}/p_#{note.order_number}.pdf")
      			system "pdftk #{Rails.root}/secured/#{@notifying_basket.order_number}/p_#{note.order_number}.pdf  stamp #{stamp} output #{Rails.root}/secured/#{@notifying_basket.order_number}/#{note.order_number}.pdf"
				FileUtils.rm("#{Rails.root}/secured/#{@notifying_basket.order_number}/stamp.pdf")
				FileUtils.rm("#{Rails.root}/secured/#{@notifying_basket.order_number}/p_#{note.order_number}.pdf")

			end
			system "zip -r -j #{Rails.root}/secured/#{@notifying_basket.order_number}.zip #{Rails.root}/secured/#{@notifying_basket.order_number}/"
			FileUtils.rm_r("#{Rails.root}/secured/#{@notifying_basket.order_number}/")
			@notifying_basket.send_order_details	
		end
			render nothing: true
	end

	def show
	end
end
