class UploaderController < ApplicationController

  def profile
    # get user's note details
    @notes = Note.where(:profile_id => current_user.profile_id)
    # count the number of uploads and downloads
    @count = @notes.size
    @downloaded = @notes.sum(:downloads)
    # calculate average price EXCLUDING prices = 0 i.e. notes just uploaded
    @anotes = @notes.where.not(price: 0)
    @averaged = @anotes.average(:price)
    # calculate the total value and the amount earned
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
