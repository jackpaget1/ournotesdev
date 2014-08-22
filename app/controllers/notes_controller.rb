# Angharad Dare-Edwards and Jack Paget 2014
# Not upload with carrierwave 4 step multipage form

class NotesController < ApplicationController

    before_filter :authorize, :except => [:index]
    before_filter :admin_auth, :only => [:update]
    def index
       session[:last_downloads_page] = request.env['HTTP_REFERER']
       @full_notes = @search.result
       @full_notes = @full_notes.where(:id => nil) unless params[:q]
       @check_params = "y" unless params[:q]
       @notes = @full_notes.where(:verified => "1").page(params[:page]).per(1)
       @count = @full_notes.all.size
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

     def update 

      @note = Note.find_by_id(session[:note_id])
      @user = User.find_by_user_name(@note.uploader)
      @note.update_attributes(params[:note])

      @name = File.basename(@note.attachment.path)
      @preview_full_path = "#{Rails.root}/public/uploads/note/preview/preview_2"+@name
      @preview_file_path = "#{Rails.root}/public/uploads/note/preview/preview_"+@name
      stamp = "#{Rails.root}/public/uploads/note/preview/stamp.pdf"

      page_count = PDF::Reader.new(@note.attachment.path).page_count

      template = @note.attachment.path
      output = "#{Rails.root}/public/uploads/note/preview/preview_"+@name

      Prawn::Document.generate(stamp, page_size: 'A4', bottom_margin: 24) do |pdf|
          pdf.text_box "Preview of #{@note.title} notes by #{@note.uploader} available on Our Notes", align: :center, valign: :top, size: 14
          pdf.text_box "Preview of #{@note.title} notes by #{@note.uploader} available on Our Notes", align: :center, valign: :bottom, size: 14
      end

      system "pdftk #{@note.attachment.path} stamp #{stamp} output #{@preview_full_path}"
      system "pdftk #{@preview_full_path} cat 1-3 output #{@preview_file_path}"

      # Copy to s3
      s3 = AWS::S3.new

      key = File.basename(@preview_file_path)
      s3.buckets['notespreview'].objects[key].write(:file => @preview_file_path)
      
      s3 = AWS::S3.new
      key = File.basename(@note.attachment.path)
      s3.buckets['securednotes'].objects[key].write(:file => @note.attachment.path)

      FileUtils.rm(@preview_full_path)
      FileUtils.rm(stamp)
      FileUtils.rm(@preview_file_path)

      @note.remove_attachment
      @note.save
      FileUtils.rm_r("#{Rails.root}/public/uploads/note/attachment/#{@note.id}")

      @user.send_verified_email(@note.id)
      session[:note_id] = nil
      redirect_to '/admin'
      
    end

    private

    def authorize
      unless current_user
        redirect_to '/login'
      end
    end

    def admin_auth
	unless current_user.email == 'AMA6qiDIc9@kyPIUwJzQa.DpXxqkKBvE'
		redirect_to root_url
	end
    end
    
end

