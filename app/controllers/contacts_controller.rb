class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		@user = current_user
			if @contact.deliver
				flash.now[:notice] = 'Thank you for your message we will respond within 72 hours.'
				redirect_to root_url
				
			else
				flash.now[:error] = 'Sorry cannot send message.'
				render :new
			end
	end


end
