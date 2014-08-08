class UploaderController < ApplicationController

  def profile
    @notes = Note.where(:profile_id => current_user.profile_id)
    @count = @notes.size
    @downloaded = @notes.sum(:downloads)
    @averaged = @notes.average(:price)
    @totalled = @notes.sum(:price)
    @earned = @notes.sum("0.5 * price * downloads")
  end

  def edit_profile
    @user = current_user
    @notes = Note.where(:profile_id => current_user.profile_id)
    @count = @notes.size
    @averaged = @notes.average(:price)
    @totalled = @notes.sum(:price)
    @earned = @notes.sum("0.5 * price * downloads")
  end

  def edit_save

    @user = current_user
    @user.update_attributes(params[:user])
    
  end


  def files
  end
end
