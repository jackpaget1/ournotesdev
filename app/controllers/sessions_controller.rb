class SessionsController < ApplicationController

  before_filter :authorize, :only => [:new]

  def new
  	@user = User.authenticate(params[:email],params[:password])
  		if @user
        if params[:remember_me]
          cookies.permanent[:auth_token] = @user.auth_token
          if @user.email == 'AMA6qiDIc9@kyPIUwJzQa.DpXxqkKBvE'
            redirect_to '/admin'
          else
          redirect_to '/profile'
        end 
        else 
          cookies[:auth_token] = @user.auth_token
          if @user.email == 'AMA6qiDIc9@kyPIUwJzQa.DpXxqkKBvE'
            redirect_to '/admin'
          else
    		  redirect_to '/profile'
        end
        end
  		else
  			session[:user_id] = nil
        flash.now[:error] = "Wrong e-mail/password combination, please try again"
        render :action => "new"

  		end
  end

  def destroy
  		cookies.delete(:auth_token)
  		redirect_to root_url
  end
private

def authorize
  if current_user
    redirect_to '/profile'
  end
end

end
