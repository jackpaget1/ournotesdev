class DownloadsController < ApplicationController



	def new
		
		@type = params[:type]
		@category = params[:category]
		@title = params[:title]
		@uploader = params[:uploader]


		if @title
			@header = @title
			@full_notes = Note.where(:title => @title)
			notes_ready(@full_notes)
		elsif @category
			if @type
			@header = @category
			@all_notes = Note.where(:cat =>  @type)
			@full_notes = @all_notes.where(:fie => @category)
			notes_ready(@full_notes)
			else
			@header = @category
			@full_notes = Note.where(:fie =>  @category)
			notes_ready(@full_notes)
			end 
		elsif @type
			@header = @type
			@full_notes = Note.where(:cat => @type)
			notes_ready(@full_notes)
		elsif @uploader
			@header = @uploader
			@full_notes = Note.where(:uploader => @uploader)
			notes_ready(@full_notes)
		end
		link_back
	end

	def show

		@note_id = params[:id]
		@current_note = Note.find_by_id(@note_id)
		@uploader = User.find_by_user_name(@current_note.uploader)
		@joined = @uploader.created_at
		#@in_basket = Basket.where(:cart_id => @current_cart.id, :note_id => @current_note.id)
		link_back
	end

	def search

	end

private
	def notes_ready(variable)
		@notes = variable.where(:verified => '1')
		@notes_count = @notes.size
	end

	def link_back
		session[:last_previews_page] = request.env['HTTP_REFERER']
	end

end
