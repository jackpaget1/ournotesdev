class FpController < ApplicationController
  def CFA1
  	@notes = Note.where(:cat => 'CFA Level 1')
  end

  def CFA2
  end

  def CFA3
  end
end
