class DocnoteController < ApplicationController
  def index
  	@docnotes = Docnotes.all
  end

  def new
  	@docnotes = Docnotes.new
  end

  def create
  	@docnotes = Docnotes.new(docnote_params)
  end

  def destroy
  end
end
