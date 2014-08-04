class SessionsController < ApplicationController
  def new
  	@user = User.authenticate(params[:email],params[:password])
  		if @user
  			session[:user_id] = @user.id
  			redirect_to '/profile'
  		else
  			session[:user_id] = nil
  			render :action => "new"
        flash[:notice] = "Wrong e-mail/password combination, please try again"

  		end
  end

  def destroy
  		session[:user_id] = nil
  		redirect_to root_url
  end
end
