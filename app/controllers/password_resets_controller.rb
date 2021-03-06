class PasswordResetsController < ApplicationController

  before_filter :authorize
  
  def create
  	user = User.find_by_email(params[:email])
  	user.send_password_reset if user
  	redirect_to root_url, :notice => "Password reset instructions sent by e-mail"
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	@user.password_reset_token = nil
    @user.save(validate:false)
  	if @user.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_reset_path, :alert => "Password reset has expired"
  	elsif @user.update_attributes(params[:user])
  		redirect_to root_url
  	else
  		render :edit
  	end
  end

  private

  def authorize
    if current_user
      redirect_to '/edit_profile'
    end
  end
  		
end
