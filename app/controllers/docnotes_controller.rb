class DocnotesController < ApplicationController
  def index
  	@docnotes = Docnote.all
  end

  def new
  	@docnote = Docnote.new
  end

  def create
  	@docnote = Docnote.new(docnote_params)

  		if @docnote.save
  			redirect_to root_url, notice: "The doc has been uploaded"
  		else
  			render "new"
  		end
  end

  def destroy
  	@docnote = Docnote.find(params[:id])
  	@docnote.destroy
  	redirect_to docnotes, notice: "Deleted"
  end

  private

  	def docnote_params
  		params.require(:docnote).permit(:name, :attachment)
  	end
  
end
