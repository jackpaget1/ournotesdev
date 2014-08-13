# Angharad Dare-Edwards and Jack Paget 2014
# Not upload with carrierwave 4 step multipage form

class NotesController < ApplicationController

    before_filter :authorize, :except => [:index]

    def index
      session[:last_downloads_page] = request.env['HTTP_REFERER']
       @full_notes = @search.result
       @notes = @full_notes.where(:verified => "1")
       @count = @full_notes.size
    end

    def new
      session[:note_params] ||= {}
      @note = Note.new(session[:note_params])
    end

    def create
      session[:note_params].deep_merge!(params[:note]) if params[:note]
      @note = Note.new(session[:note_params])
      @note.current_step = session[:note_step]
    if @note.valid? 
      if params[:back_button]
        @note.previous_step
      elsif @note.last_step?
        @note.save
      else
         @note.next_step
      end
    end
      session[:note_step] = @note.current_step
      if @note.new_record?
        render "new"
      else 
        session[:note_step] = session[:note_params] = nil
        redirect_to '/profile'
      end
    end

    def edit

    end

    private

    def authorize
      unless current_user
        redirect_to '/login'
      end
    end
    
end

