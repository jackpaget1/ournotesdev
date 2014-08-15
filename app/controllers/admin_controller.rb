class AdminController < ApplicationController

	before_filter :authorize

	def index
		@notes_to_ver = Note.where(:verified => 0)
		@admin_search = Note.search(params[:q])
		@up_last_day = Note.where("created_at > ?", 1.days.ago)
		@up_last_week = Note.where("created_at > ?", 7.days.ago)
		@down_last_day = Cart.where("purchased_at > ?", 1.days.ago)
		@down_last_week = Cart.where("purchased_at > ?", 7.days.ago)
		@carts_pay = Cart.where(:created_at => (Time.now.midnight - 1.day)..(Time.now.midnight))
		@payout = @carts_pay.size
		@baskets_pay = []

		@carts_pay.each do |cart|
			tbasket = Basket.where(:cart_id => cart.id)
			@baskets_pay += tbasket if tbasket
		end

		@notes_pay = []
		@baskets_pay.each do |cart|
			tnote = Note.where(:id => cart.note_id)
			@notes_pay += tnote if tnote
		end

		@uploader_emails = []
		@notes_pay.each do |note|
			tuser = User.where(:user_name => note.uploader)
			@uploader_emails += tuser if tuser
		end 

		@count_to_ver = @notes_to_ver.size
		@up_last_day = @up_last_day.size
		@up_last_week = @up_last_week.size
		@down_last_day = @down_last_day.size
		@down_last_week = @down_last_week.size
	end

	def verify

		@this_id = params[:id].to_i
		session[:note_id] = @this_id
		@note = Note.find_by_id(@this_id)
		render :edit
		
	end
private

	def authorize
		if current_user
			unless current_user.email == 'AMA6qiDIc9@kyPIUwJzQa.DpXxqkKBvE'
				redirect_to '/profile'
			end
		else
			redirect_to '/login'
		end
	end


	
end
