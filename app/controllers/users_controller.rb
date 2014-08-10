class UsersController < ApplicationController

  before_filter :authorize, :only => [:profile, :edit, :update]
  before_filter :not_user, :only => [:create, :new]
  
  def new
    @user = User.new
  end

  def create
  	@user = User.new(params[:user])
  		if @user.save
        cookies[:auth_token] = @user.auth_token
        user = User.find_by_auth_token(cookies[:auth_token])
        user.send_registration_confirmation
  			redirect_to '/profile'
  		else
  			render :action => "new"
  		end
  end

  def profile
    find_users_notes
  end

  def edit
    find_users_notes
  end

  def update
    @user = User.find_by_auth_token(cookies[:auth_token])
    if @user.update_attributes(params[:user])
      redirect_to '/profile'
    else
      render :edit
    end
  end

  private

  def authorize
    unless current_user
      redirect_to '/login'
    end 
  end

  def not_user
    if current_user
      redirect_to '/login'
    end
  end

  def find_users_notes
    @user = User.find_by_auth_token(cookies[:auth_token])

    if @user
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
  end


end
