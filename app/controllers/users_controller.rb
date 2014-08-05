class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.new(params[:user])
  		if @user.save
        cookies[:auth_token] = @user.auth_token
        UserMailer.registration_confirmation(@user).deliver
  			redirect_to '/profile'
  		else
  			render :action => "new"
  		end
  end

  def change_payment
    @user = User.find_by(params[:profile_id])
    @user.payment_method = 'BOB'
    @user.save

  end

end
