class FpController < ApplicationController

  def new
    @notes = Note.where(:title => 'CFA Level 1')
    @count = @notes.size
    notes_downloads('CFA Level 1')
  end

  def CFA1
	notes_downloads('CFA Level 1')
  end

  def new

  end

  def CFA2
  	notes_downloads('CFA Level 2')
  end

  def CFA3
  	@full_notes = Note.where(:title => 'CFA Level 2')
  	@notes = @full_notes.where(:verified => '1')
  	@notes_count = @notes.size
  end
end
